require 'spec'

require 'net/http'
require 'uri'

Before do
  @headers = {}
end

Given /^I have set (.+) as a target URI$/ do |uri|
  @uri = uri
end

Given /^I have set (\w+) If-Modified-Since header$/ do |condition|
  if condition == 'modified'
    @headers['If-Modified-Since'] = 'hogehoge'
  elsif condition == 'unmodified'
    @headers['If-Modified-Since'] = 'fugafuga'
  end
end

Given /^I have set (\w+) If-None-Match header$/ do |condition|
  if condition == 'modified'
    @headers['If-None-Match'] = 'hogehoge'
  elsif condition == 'unmodified'
    @headers['If-None-Match'] = 'fugafuga'
  end
end

Given /^I have set (\w+) If-Unmodified-Since header$/ do |condition|
  if condition == 'modified'
    @headers['If-Unmodified-Since'] = 'hogehoge'
  elsif condition == 'unmodified'
    @headers['If-Unodified-Since'] = 'fugafuga'
  end
end

Given /^I have set (\w+) If-Match header$/ do |condition|
  if condition == 'modified'
    @headers['If-Match'] = 'hogehoge'
  elsif condition == 'unmodified'
    @headers['If-Match'] = 'fugafuga'
  end
end

When /^I GET$/ do
  parsed_uri = URI.parse(@uri)
  http = Net::HTTP.new(parsed_uri.host, parsed_uri.port)
  @response = http.get(parsed_uri.path, @headers)
end

Then /^the response status code should be (\d{3})$/ do |code|
  @response.code.to_i.should == code.to_i
end
