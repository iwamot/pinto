$LOAD_PATH << 'lib'
require 'pinto'

describe 'Pinto.version' do
  it 'should return "0.0.1"' do
    Pinto.version.should == '0.0.1'
  end
end
