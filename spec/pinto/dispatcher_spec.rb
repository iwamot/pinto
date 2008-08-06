$LOAD_PATH << 'lib'
require 'pinto'

describe 'Pinto::Dispatcher#call' do
  before do
    @dispatcher = Pinto::Dispatcher.new
  end

  it 'should raise ArgumentError when env is not Hash' do
    lambda {@dispatcher.call(nil)}.should raise_error(
      ArgumentError, 'env must be Hash'
    )
  end

  it 'should return "404 Not Found" when non-existent URI is requested' do
    env = Rack::MockRequest.env_for('http://pinto.jp/notfound')
    response = @dispatcher.call(env)
    response[0].should == 404
  end

  it 'should not return "404 Not Found" when existent URI is requested' do
    env = Rack::MockRequest.env_for('http://en.pinto.jp/')
    response = @dispatcher.call(env)
    response[0].should_not == 404
  end
end
