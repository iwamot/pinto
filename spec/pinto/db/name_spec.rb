$LOAD_PATH << 'lib'
require 'pinto'

describe 'Pinto::DB::Name.new' do
  it 'should raise ArgumentError when name is not String' do
    lambda {
      Pinto::DB::Name.new(nil)
    }.should raise_error(
      ArgumentError, 'name must be String'
    )
  end
end

describe 'Pinto::DB::Name#to_s' do
  it 'should return given name' do
    name_str = 'pinto'
    name = Pinto::DB::Name.new(name_str)
    name.to_s.should == name_str
  end
end
