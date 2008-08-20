$LOAD_PATH << 'lib'
require 'pinto'

describe 'Pinto::OpenID.begin' do
  before do
    @locale = Pinto::Locale.new('en');
  end

  it 'should raise ArgumentError when user_supplied_id is not Pinto::Type::UserSuppliedID' do
    lambda {Pinto::OpenID.begin(nil, @locale)}.should raise_error(
      ArgumentError, 'user_supplied_id must be Pinto::Type::UserSuppliedID'
    )
  end
end
