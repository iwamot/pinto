$LOAD_PATH << 'lib'
require 'pinto'

describe 'Pinto::DB::Host.new' do
  it 'should raise ArgumentError when host is not String' do
    lambda {
      Pinto::DB::Host.new(nil)
    }.should raise_error(
      ArgumentError, 'host must be String'
    )
  end
end

describe 'Pinto::DB::Host#to_s' do
  it 'should return given host' do
    host_str = 'localhost'
    host = Pinto::DB::Host.new(host_str)
    host.to_s.should == host_str
  end
end
