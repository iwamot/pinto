$LOAD_PATH << 'lib'
require 'pinto'

describe 'Pinto::Helper::HTML::Escaper.escape_value' do
  before do
    @escaper = Class.new
    @escaper.extend(Pinto::Helper::HTML::Escaper)
  end

  it 'should raise ArgumentError when value is not String' do
    lambda {@escaper.escape_value(nil)}.should raise_error(
      ArgumentError, 'value must be String'
    )
  end

  it 'should raise ArgumentError when value is not UTF-8 String' do
    lambda {@escaper.escape_value("\x80")}.should raise_error(
      ArgumentError, 'value is not UTF-8 string'
    )
  end

  it 'should return "&amp;" when "&" is given' do
    result = @escaper.escape_value('&')
    result.should == '&amp;'
  end

  it 'should return "&lt;" when "<" is given' do
    result = @escaper.escape_value('<')
    result.should == '&lt;'
  end

  it 'should return "&gt;" when ">" is given' do
    result = @escaper.escape_value('>')
    result.should == '&gt;'
  end

  it 'should not escape "\""' do
    result = @escaper.escape_value('"')
    result.should == '"'
  end

  it 'should remove control characters' do
    result = @escaper.escape_value("\x00\x7F\xC2\x80")
    result.should == ''
  end
end

describe 'Pinto::Helper::HTML::Escaper.escape_attribute' do
  before do
    @escaper = Class.new
    @escaper.extend(Pinto::Helper::HTML::Escaper)
  end

  it 'should raise ArgumentError when value is not String' do
    lambda {@escaper.escape_attribute(nil)}.should raise_error(
      ArgumentError, 'value must be String'
    )
  end

  it 'should raise ArgumentError when value is not UTF-8 String' do
    lambda {@escaper.escape_attribute("\x80")}.should raise_error(
      ArgumentError, 'value is not UTF-8 string'
    )
  end

  it 'should return "&amp;" when "&" is given' do
    result = @escaper.escape_attribute('&')
    result.should == '&amp;'
  end

  it 'should return "&lt;" when "<" is given' do
    result = @escaper.escape_attribute('<')
    result.should == '&lt;'
  end

  it 'should return "&gt;" when ">" is given' do
    result = @escaper.escape_attribute('>')
    result.should == '&gt;'
  end

  it 'should return "&quot;" when "\"" is given' do
    result = @escaper.escape_attribute('"')
    result.should == '&quot;'
  end

  it 'should remove control characters' do
    result = @escaper.escape_attribute("\x00\x7F\xC2\x80")
    result.should == ''
  end
end

describe 'Pinto::Helper::HTML::Escaper.escape_tag' do
  before do
    @escaper = Class.new
    @escaper.extend(Pinto::Helper::HTML::Escaper)
  end

  it 'should raise ArgumentError when value is not String' do
    lambda {@escaper.escape_tag(nil)}.should raise_error(
      ArgumentError, 'value must be String'
    )
  end

  it 'should raise ArgumentError when value is not UTF-8 String' do
    lambda {@escaper.escape_tag("\x80")}.should raise_error(
      ArgumentError, 'value is not UTF-8 string'
    )
  end

  it 'should not escape "&"' do
    result = @escaper.escape_tag('&')
    result.should == '&'
  end

  it 'should not escape "<"' do
    result = @escaper.escape_tag('<')
    result.should == '<'
  end

  it 'should not escape ">"' do
    result = @escaper.escape_tag('>')
    result.should == '>'
  end

  it 'should not escape "\""' do
    result = @escaper.escape_tag('"')
    result.should == '"'
  end

  it 'should remove control characters' do
    result = @escaper.escape_tag("\x00\x7F\xC2\x80")
    result.should == ''
  end
end
