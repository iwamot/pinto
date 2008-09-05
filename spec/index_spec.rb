require 'digest/md5'
require 'net/http'
require 'time'

describe 'Multiple Choices', :shared => true do
  it 'should return 300 for status code' do
    @response.code.should == '300'
  end

  it 'should return MD5 of response body for ETag header' do
    @response['ETag'].should ==
          '"' + Digest::MD5.hexdigest(@response.body) + '"'
  end

  it 'should return "en" for Content-Language header' do
    @response['Content-Language'].should == 'en'
  end

  it 'should return past time in HTTP-date for Last-Modified header' do
    Time.now.should >= Time.httpdate(@response['Last-Modified'])
  end
end

describe 'Not Modified', :shared => true do
  it 'should return 304 for status code' do
    @response.code.should == '304'
  end

  it 'should return the same ETag header' do
    @response['ETag'].should == @etag
  end

  it 'should not return other entity headers' do
    @response.key?('Allow').should be_false
    @response.key?('Content-Encoding').should be_false
    @response.key?('Content-Length').should be_false
    @response.key?('Content-Location').should be_false
    @response.key?('Content-MD5').should be_false
    @response.key?('Content-Range').should be_false
    @response.key?('Content-Type').should be_false
    @response.key?('Expires').should be_false
    @response.key?('Last-Modified').should be_false
  end
end

describe 'XHTML', :shared => true do
  it 'should return "application/xhtml+xml; charset=UTF-8" for Content-Type header' do
    @response['Content-Type'].should == 'application/xhtml+xml; charset=UTF-8'
  end
end

describe 'Cacheable for 6 Hours', :shared => true do
  it 'should return "max-age=21600" for Cache-Control header' do
    @response['Cache-Control'].should == 'max-age=21600'
  end

  it 'should return time 6 hours later than Last-Modified for Expires header' do
    Time.httpdate(@response['Expires']).should ==
          Time.httpdate(@response['Last-Modified']) + (60 * 60 * 6)
  end
end

describe 'Getable', :shared => true do
  it 'should return "GET, HEAD, OPTIONS" for Allow header' do
    @response['Allow'].should == 'GET, HEAD, OPTIONS'
  end
end

describe 'http://pinto.jp/' do
  before(:all) do
    @http = Net::HTTP.new('pinto.jp', 80)
  end

  describe 'when non-conditional GET' do
    before(:all) do
      @response = @http.get('/')
    end

    it_should_behave_like 'Multiple Choices'
    it_should_behave_like 'XHTML'
    it_should_behave_like 'Cacheable for 6 Hours'
    it_should_behave_like 'Getable'
  end

  describe 'when GET with valid entity tag for If-None-Match header' do
    before(:all) do
      first_response = @http.get('/')
      @etag = first_response['ETag']
      @response = @http.get('/', 'If-None-Match' => @etag)
    end

    it_should_behave_like 'Not Modified'
  end

  describe 'when GET with invalid entity tag for If-None-Match header' do
    before(:all) do
      first_response = @http.get('/')
      @etag = first_response['ETag']
      @response = @http.get('/', 'If-None-Match' => @etag + 'zzz')
    end

    it_should_behave_like 'Multiple Choices'
    it_should_behave_like 'XHTML'
    it_should_behave_like 'Cacheable for 6 Hours'
    it_should_behave_like 'Getable'
  end

  describe 'when GET with entity tags including valid one for If-None-Match header' do
    before(:all) do
      first_response = @http.get('/')
      @etag = first_response['ETag']
      @response = @http.get('/', 'If-None-Match' => '"invalid", ' + @etag)
    end

    it_should_behave_like 'Not Modified'
  end

  describe 'when GET with entity tags not including valid one for If-None-Match header' do
    before(:all) do
      first_response = @http.get('/')
      @etag = first_response['ETag']
      @response = @http.get('/', 'If-None-Match' => '"invalid", zzz' + @etag)
    end

    it_should_behave_like 'Multiple Choices'
    it_should_behave_like 'XHTML'
    it_should_behave_like 'Cacheable for 6 Hours'
    it_should_behave_like 'Getable'
  end

  describe 'when GET with "*" for If-None-Match header' do
    before(:all) do
      first_response = @http.get('/')
      @etag = first_response['ETag']
      @response = @http.get('/', 'If-None-Match' => '*')
    end

    it_should_behave_like 'Not Modified'
  end

  describe 'when GET with valid RFC 1123 time for If-Modified-Since header' do
    before(:all) do
      first_response = @http.get('/')
      last_modified = first_response['Last-Modified']
      @etag = first_response['ETag']
      @response = @http.get('/', 'If-Modified-Since' => last_modified)
    end

    it_should_behave_like 'Not Modified'
  end

  describe 'when GET with valid RFC 1036 time for If-Modified-Since header' do
    before(:all) do
      first_response = @http.get('/')
      last_modified = first_response['Last-Modified']
      last_modified_rfc1036 = Time.httpdate(last_modified).utc.
                              strftime('%A, %d-%b-%y %H:%M:%S GMT')
      @etag = first_response['ETag']
      @response = @http.get('/', 'If-Modified-Since' => last_modified_rfc1036)
    end

    it_should_behave_like 'Not Modified'
  end

  describe 'when GET with valid asctime() formatted time for If-Modified-Since header' do
    before(:all) do
      first_response = @http.get('/')
      last_modified = first_response['Last-Modified']
      last_modified_asctime = Time.httpdate(last_modified).utc.
                              strftime('%a %b ' + Time.httpdate(last_modified).day.to_s.rjust(2) + ' %H:%M:%S %Y')
      @etag = first_response['ETag']
      @response = @http.get('/', 'If-Modified-Since' => last_modified_asctime)
    end

    it_should_behave_like 'Not Modified'
  end

  describe 'when GET with advanced time for If-Modified-Since header' do
    before(:all) do
      first_response = @http.get('/')
      last_modified = first_response['Last-Modified']
      invalid_time = Time.httpdate(last_modified).utc.succ.httpdate
      @response = @http.get('/', 'If-Modified-Since' => invalid_time)
    end

    it_should_behave_like 'Multiple Choices'
    it_should_behave_like 'XHTML'
    it_should_behave_like 'Cacheable for 6 Hours'
    it_should_behave_like 'Getable'
  end

  describe 'when GET with delayed time for If-Modified-Since header' do
    before(:all) do
      first_response = @http.get('/')
      last_modified = first_response['Last-Modified']
      invalid_time = Time.httpdate(last_modified).utc.succ.httpdate
      @response = @http.get('/', 'If-Modified-Since' => invalid_time)
    end

    it_should_behave_like 'Multiple Choices'
    it_should_behave_like 'XHTML'
    it_should_behave_like 'Cacheable for 6 Hours'
    it_should_behave_like 'Getable'
  end

  describe 'when GET with malformed time for If-Modified-Since header' do
    before(:all) do
      @response = @http.get('/', 'If-Modified-Since' => 'zzz')
    end

    it_should_behave_like 'Multiple Choices'
    it_should_behave_like 'XHTML'
    it_should_behave_like 'Cacheable for 6 Hours'
    it_should_behave_like 'Getable'
  end

  describe 'when GET with valid If-None-Match header and valid If-Modified-Since header' do
    before(:all) do
      first_response = @http.get('/')
      last_modified = first_response['Last-Modified']
      @etag = first_response['ETag']
      @response = @http.get('/', 'If-Modified-Since' => last_modified,
                                 'If-None-Match'     => @etag)
    end

    it_should_behave_like 'Not Modified'
  end

  describe 'when GET with invalid If-None-Match header and valid If-Modified-Since header' do
    before(:all) do
      first_response = @http.get('/')
      last_modified = first_response['Last-Modified']
      etag = first_response['ETag']
      @response = @http.get('/', 'If-Modified-Since' => last_modified,
                                 'If-None-Match'     => etag + 'zzz')
    end

    it_should_behave_like 'Multiple Choices'
    it_should_behave_like 'XHTML'
    it_should_behave_like 'Cacheable for 6 Hours'
    it_should_behave_like 'Getable'
  end

  describe 'when GET with valid If-None-Match header and invalid If-Modified-Since header' do
    before(:all) do
      first_response = @http.get('/')
      last_modified = Time.httpdate(first_response['Last-Modified']).utc
      etag = first_response['ETag']
      @response = @http.get('/', 'If-Modified-Since' => last_modified.succ.httpdate,
                                 'If-None-Match'     => etag)
    end

    it_should_behave_like 'Multiple Choices'
    it_should_behave_like 'XHTML'
    it_should_behave_like 'Cacheable for 6 Hours'
    it_should_behave_like 'Getable'
  end

  # If-Match、If-Unmodified-Since

  # HEAD

  # OPTIONS
end
