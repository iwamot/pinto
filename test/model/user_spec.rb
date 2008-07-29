$LOAD_PATH << 'lib'
require 'pinto'

describe Pinto::Model::User, 'when user_name is nil for add method' do
  it 'should raise error in English when lang is "en"' do
    lambda {Pinto::Model::User.add(nil, 'dummy', 'en')}.should raise_error
  end

  it 'should raise error in Japanese when lang is "ja"' do
    lambda {Pinto::Model::User.add(nil, 'dummy', 'ja')}.should raise_error
  end
end
