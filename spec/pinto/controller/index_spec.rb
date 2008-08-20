$LOAD_PATH << 'lib'
require 'pinto'

describe 'Pinto::Controller::Index#get_action' do
  before do
    @controller = Pinto::Controller::Index.new
  end

  it 'should raise ArgumentError when request is not Pinto::Request' do
    lambda {
      @controller.get_action(nil)
    }.should raise_error(
      ArgumentError, 'request must be Pinto::Request'
    )
  end
end