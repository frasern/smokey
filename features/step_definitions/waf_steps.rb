Given /^I set header ([^\s]+) to ([^\s]+)/ do |header_name, header_value|
  @headers ||= {}
  @headers[header_name.to_sym] = header_value
end

When /^I send a (\w+) request to "(.*?)"$/ do |method, path|
  @response = do_http_request("#{@host}#{path}", method.downcase.to_sym, default_request_options.merge({:headers => @headers}))
end

Then /^the response status should be "([^"]*)"$/ do |status|
  expect(@response.code).to eq(status)
end
