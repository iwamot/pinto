$LOAD_PATH << 'lib'
require 'pinto'

describe 'Pinto::Model::User.add' do
  it 'should raise ArgumentError when user_name is not Pinto::Type::UserName' do
    claimed_id = Pinto::Type::ClaimedID.new('test')
    lambda {Pinto::Model::User.add(nil, claimed_id)}.should raise_error(
      ArgumentError, 'user_name must be Pinto::Type::UserName'
    )
  end

  it 'should raise ArgumentError when claimed_id is not Pinto::Type::ClaimedID' do
    user_name = Pinto::Type::UserName.new('test')
    lambda {Pinto::Model::User.add(user_name, nil)}.should raise_error(
      ArgumentError, 'claimed_id must be Pinto::Type::ClaimedID'
    )
  end
end
