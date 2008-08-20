$LOAD_PATH << 'lib'
require 'pinto'

describe 'Pinto::Controller::Users#post_action' do
  before do
    @controller = Pinto::Controller::Users.new
  end

  it 'should raise ArgumentError when request is not Pinto::Request' do
    lambda {
      @controller.post_action(nil)
    }.should raise_error(
      ArgumentError, 'request must be Pinto::Request'
    )
  end
end
