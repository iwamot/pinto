$LOAD_PATH << 'lib'
require 'pinto'

describe 'Pinto::Config.load' do
  it 'should raise ArgumentError when key is not Pinto::Type::ConfigKey' do
    lambda {Pinto::Config.load(nil)}.should raise_error(
      ArgumentError, 'key must be Pinto::Type::ConfigKey'
    )
  end

  it 'should raise ArgumentError when non-existent key is given' do
    key = Pinto::Type::ConfigKey.new('non-existent')
    lambda {Pinto::Config.load(key)}.should raise_error(
      ArgumentError, 'non-existent key was given'
    )
  end

  it 'should be able to load values from config file' do
    key = Pinto::Type::ConfigKey.new('openid_providers')
    openid_providers = Pinto::Config.load(key)
    openid_providers.should include('yahoo.com')
  end
end

describe 'Pinto::Config.db' do
  it 'should be able to load values from db config file' do
    db_setting = Pinto::Config.db
    db_setting['name'].should == 'pinto'
  end
end
