$LOAD_PATH << 'lib'
require 'pinto'

describe 'Pinto::Model::SignupReservation.add' do
  it 'should raise ArgumentError when claimed_id is not Pinto::Type::ClaimedID' do
    lambda {
      Pinto::Model::SignupReservation.add(nil)
    }.should raise_error(
      ArgumentError, 'claimed_id must be Pinto::Type::ClaimedID'
    )
  end

end
