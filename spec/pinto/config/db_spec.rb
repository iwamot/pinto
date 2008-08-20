$LOAD_PATH << 'lib'
require 'pinto'

describe 'Pinto::Config::DB.load' do
  it 'should be able to load values from db config file' do
    db_config = Pinto::Config::DB.load
    db_config.name.to_s.should == 'pinto'
  end
end

describe 'Pinto::Config::DB.new' do
  before do
    @host     = Pinto::DB::Host.new('localhost')
    @name     = Pinto::DB::Name.new('pinto')
    @user     = Pinto::DB::User.new('hogehoge')
    @password = Pinto::DB::Password.new('fugafuga')
  end

  it 'should raise ArgumentError when host is not Pinto::DB::Host' do
    lambda {
      Pinto::Config::DB.new(nil, @name, @user, @password)
    }.should raise_error(
      ArgumentError, 'host must be Pinto::DB::Host'
    )
  end

  it 'should raise ArgumentError when name is not Pinto::DB::Name' do
    lambda {
      Pinto::Config::DB.new(@host, nil, @user, @password)
    }.should raise_error(
      ArgumentError, 'name must be Pinto::DB::Name'
    )
  end

  it 'should raise ArgumentError when user is not Pinto::DB::User' do
    lambda {
      Pinto::Config::DB.new(@host, @name, nil, @password)
    }.should raise_error(
      ArgumentError, 'user must be Pinto::DB::User'
    )
  end

  it 'should raise ArgumentError when password is not Pinto::DB::Password' do
    lambda {
      Pinto::Config::DB.new(@host, @name, @user, nil)
    }.should raise_error(
      ArgumentError, 'password must be Pinto::DB::Password'
    )
  end
end

describe 'Pinto::Config::DB#host' do
  it 'should return given host' do
    host     = Pinto::DB::Host.new('localhost')
    name     = Pinto::DB::Name.new('pinto')
    user     = Pinto::DB::User.new('hogehoge')
    password = Pinto::DB::Password.new('fugafuga')

    db_config = Pinto::Config::DB.new(host, name, user, password)
    db_config.host.should == host
  end
end

describe 'Pinto::Config::DB#name' do
  it 'should return given name' do
    host     = Pinto::DB::Host.new('localhost')
    name     = Pinto::DB::Name.new('pinto')
    user     = Pinto::DB::User.new('hogehoge')
    password = Pinto::DB::Password.new('fugafuga')

    db_config = Pinto::Config::DB.new(host, name, user, password)
    db_config.name.should == name
  end
end

describe 'Pinto::Config::DB#user' do
  it 'should return given user' do
    host     = Pinto::DB::Host.new('localhost')
    name     = Pinto::DB::Name.new('pinto')
    user     = Pinto::DB::User.new('hogehoge')
    password = Pinto::DB::Password.new('fugafuga')

    db_config = Pinto::Config::DB.new(host, name, user, password)
    db_config.user.should == user
  end
end

describe 'Pinto::Config::DB#password' do
  it 'should return given password' do
    host     = Pinto::DB::Host.new('localhost')
    name     = Pinto::DB::Name.new('pinto')
    user     = Pinto::DB::User.new('hogehoge')
    password = Pinto::DB::Password.new('fugafuga')

    db_config = Pinto::Config::DB.new(host, name, user, password)
    db_config.password.should == password
  end
end
