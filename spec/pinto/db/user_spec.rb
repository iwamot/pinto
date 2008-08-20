$LOAD_PATH << 'lib'
require 'pinto'

describe 'Pinto::DB::User.new' do
  it 'should raise ArgumentError when user is not String' do
    lambda {
      Pinto::DB::User.new(nil)
    }.should raise_error(
      ArgumentError, 'user must be String'
    )
  end
end

describe 'Pinto::DB::User#to_s' do
  it 'should return given user' do
    user_str = 'iwamot'
    user = Pinto::DB::User.new(user_str)
    user.to_s.should == user_str
  end
end
