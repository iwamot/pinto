require 'digest/md5'
require 'net/http'
require 'time'

describe 'http://pinto.jp/' do
  before(:all) do
    @http = Net::HTTP.new('pinto.jp', 80)
  end

  describe 'when non-conditional GET' do
    before(:all) do
      @response = @http.get('/')
    end

    it 'should return 300 for status code' do
      @response.code.should == '300'
    end

    it 'should return "max-age=21600" for Cache-Control header' do
      @response['Cache-Control'].should == 'max-age=21600'
    end

    it 'should return MD5 of response body for ETag header' do
      @response['ETag'].should ==
            '"' + Digest::MD5.hexdigest(@response.body) + '"'
    end

    it 'should return "GET, HEAD, OPTIONS" for Allow header' do
      @response['Allow'].should == 'GET, HEAD, OPTIONS'
    end

    it 'should return "en" for Content-Language header' do
      @response['Content-Language'].should == 'en'
    end

    it 'should return "application/xhtml+xml; charset=UTF-8" for Content-Type header' do
      @response['Content-Type'].should ==
            'application/xhtml+xml; charset=UTF-8'
    end

    it 'should return past time in HTTP-date for Last-Modified header' do
      Time.now.should >= Time.httpdate(@response['Last-Modified'])
    end

    it 'should return time 6 hours later than Last-Modified for Expires header' do
      Time.httpdate(@response['Expires']).should ==
            Time.httpdate(@response['Last-Modified']) + (60 * 60 * 6)
    end
  end

  describe 'when GET with valid entity tag for If-None-Match header' do
    before(:all) do
      first_response = @http.get('/')
      @etag = first_response['ETag']
      @response = @http.get('/', 'If-None-Match' => @etag)
    end

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

  describe 'when GET with invalid entity tag for If-None-Match header' do
    before(:all) do
      first_response = @http.get('/')
      @etag = first_response['ETag']
      @response = @http.get('/', 'If-None-Match' => @etag + 'zzz')
    end

    it 'should return 300 for status code' do
      @response.code.should == '300'
    end

    it 'should return "max-age=21600" for Cache-Control header' do
      @response['Cache-Control'].should == 'max-age=21600'
    end

    it 'should return MD5 of response body for ETag header' do
      @response['ETag'].should ==
            '"' + Digest::MD5.hexdigest(@response.body) + '"'
    end

    it 'should return "GET, HEAD, OPTIONS" for Allow header' do
      @response['Allow'].should == 'GET, HEAD, OPTIONS'
    end

    it 'should return "en" for Content-Language header' do
      @response['Content-Language'].should == 'en'
    end

    it 'should return "application/xhtml+xml; charset=UTF-8" for Content-Type header' do
      @response['Content-Type'].should ==
            'application/xhtml+xml; charset=UTF-8'
    end

    it 'should return past time in HTTP-date for Last-Modified header' do
      Time.now.should >= Time.httpdate(@response['Last-Modified'])
    end

    it 'should return time 6 hours later than Last-Modified for Expires header' do
      Time.httpdate(@response['Expires']).should ==
            Time.httpdate(@response['Last-Modified']) + (60 * 60 * 6)
    end
  end

  describe 'when GET with entity tags including valid one for If-None-Match header' do
    before(:all) do
      first_response = @http.get('/')
      @etag = first_response['ETag']
      @response = @http.get('/', 'If-None-Match' => '"invalid", ' + @etag)
    end

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

  describe 'when GET with entity tags not including valid one for If-None-Match header' do
    before(:all) do
      first_response = @http.get('/')
      @etag = first_response['ETag']
      @response = @http.get('/', 'If-None-Match' => '"invalid", zzz' + @etag)
    end

    it 'should return 300 for status code' do
      @response.code.should == '300'
    end

    it 'should return "max-age=21600" for Cache-Control header' do
      @response['Cache-Control'].should == 'max-age=21600'
    end

    it 'should return MD5 of response body for ETag header' do
      @response['ETag'].should ==
            '"' + Digest::MD5.hexdigest(@response.body) + '"'
    end

    it 'should return "GET, HEAD, OPTIONS" for Allow header' do
      @response['Allow'].should == 'GET, HEAD, OPTIONS'
    end

    it 'should return "en" for Content-Language header' do
      @response['Content-Language'].should == 'en'
    end

    it 'should return "application/xhtml+xml; charset=UTF-8" for Content-Type header' do
      @response['Content-Type'].should ==
            'application/xhtml+xml; charset=UTF-8'
    end

    it 'should return past time in HTTP-date for Last-Modified header' do
      Time.now.should >= Time.httpdate(@response['Last-Modified'])
    end

    it 'should return time 6 hours later than Last-Modified for Expires header' do
      Time.httpdate(@response['Expires']).should ==
            Time.httpdate(@response['Last-Modified']) + (60 * 60 * 6)
    end
  end

  describe 'when GET with "*" for If-None-Match header' do
    before(:all) do
      first_response = @http.get('/')
      @etag = first_response['ETag']
      @response = @http.get('/', 'If-None-Match' => '*')
    end

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

  describe 'when GET with valid RFC 1123 time for If-Modified-Since header' do
    before(:all) do
      first_response = @http.get('/')
      @last_modified = first_response['Last-Modified']
      @etag = first_response['ETag']
      @response = @http.get('/', 'If-Modified-Since' => @last_modified)
    end

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
end
