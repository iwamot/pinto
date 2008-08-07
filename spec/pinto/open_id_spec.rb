$LOAD_PATH << 'lib'
require 'pinto'

describe 'Pinto::OpenID.begin' do
  before do
    @lang_code = Pinto::Language::Code.new('en');
  end

  it 'should raise ArgumentError when user_supplied_id is not Pinto::Type::UserSuppliedID' do
    lambda {Pinto::OpenID.begin(nil, @lang_code)}.should raise_error(
      ArgumentError, 'user_supplied_id must be Pinto::Type::UserSuppliedID'
    )
  end
end
