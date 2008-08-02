$LOAD_PATH << 'lib'
require 'pinto'

describe Pinto::Model::User, 'add method is called' do
  it 'should raise ArgumentError when invalid user_name is passed' do
    lambda {
      Pinto::Model::User.add(nil, Pinto::Type::UserName.new('test'))
    }.should raise_error(ArgumentError)
  end

  it 'should raise ArgumentError when invalid claimed_id is passed' do
    lambda {
      Pinto::Model::User.add(Pinto::Type::ClaimedID.new('test'), nil)
    }.should raise_error(ArgumentError)
  end
end

=begin
describe Pinto::Model::User, 'when user_name is nil for add method' do
  it 'should raise English error when lang is "en"' do
    lambda {
      Pinto::Model::User.add(nil, 'dummy', 'en')
    }.should raise_error(ArgumentError, 'User name is required')
  end

  it 'should raise Japanese error when lang is "ja"' do
    lambda {
      Pinto::Model::User.add(nil, 'dummy', 'ja')
    }.should raise_error(ArgumentError, 'ユーザー名は必須です')
  end
end

describe Pinto::Model::User, 'when user_name is empty for add method' do
  it 'should raise English error when lang is "en"' do
    lambda {
      Pinto::Model::User.add('', 'dummy', 'en')
    }.should raise_error(ArgumentError, 'User name is required')
  end

  it 'should raise Japanese error when lang is "ja"' do
    lambda {
      Pinto::Model::User.add('', 'dummy', 'ja')
    }.should raise_error(ArgumentError, 'ユーザー名は必須です')
  end
end

describe Pinto::Model::User, 'when claimed_id is nil for add method' do
  it 'should raise English error when lang is "en"' do
    lambda {
      Pinto::Model::User.add('dummy', nil, 'en')
    }.should raise_error(ArgumentError, 'OpenID is required')
  end

  it 'should raise Japanese error when lang is "ja"' do
    lambda {
      Pinto::Model::User.add('dummy', nil, 'ja')
    }.should raise_error(ArgumentError, 'OpenIDは必須です')
  end
end

describe Pinto::Model::User, 'when claimed_id is empty for add method' do
  it 'should raise English error when lang is "en"' do
    lambda {
      Pinto::Model::User.add('dummy', '', 'en')
    }.should raise_error(ArgumentError, 'OpenID is required')
  end

  it 'should raise Japanese error when lang is "ja"' do
    lambda {
      Pinto::Model::User.add('dummy', '', 'ja')
    }.should raise_error(ArgumentError, 'OpenIDは必須です')
  end
end
=end
