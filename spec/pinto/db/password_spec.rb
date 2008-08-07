$LOAD_PATH << 'lib'
require 'pinto'

describe 'Pinto::DB::Password.new' do
  it 'should raise ArgumentError when password is not String' do
    lambda {
      Pinto::DB::Password.new(nil)
    }.should raise_error(
      ArgumentError, 'password must be String'
    )
  end
end

describe 'Pinto::DB::Password#to_s' do
  it 'should return given password' do
    password_str = 'hogehoge'
    password = Pinto::DB::Password.new(password_str)
    password.to_s.should == password_str
  end
end
