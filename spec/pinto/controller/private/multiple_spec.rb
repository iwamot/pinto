$LOAD_PATH << 'lib'
require 'pinto'

describe 'Pinto::Controller::Private::Multiple.run' do
  it 'should raise ArgumentError when request is not Pinto::Request' do
    lambda {
      Pinto::Controller::Private::Multiple.run(nil)
    }.should raise_error(
      ArgumentError, 'request must be Pinto::Request'
    )
  end
end
