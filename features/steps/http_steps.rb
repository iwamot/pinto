require 'spec'

require 'net/http'
require 'uri'

When /I (\w+) (.+)/ do |method, uri|
  parsed_uri = URI.parse(uri)
  http = Net::HTTP.new(parsed_uri.host, parsed_uri.port)
  @response = http.send(method.downcase, parsed_uri.path)
end

Then /the response status code should be (\d{3})/ do |code|
  @response.code.to_i.should == code.to_i
end

