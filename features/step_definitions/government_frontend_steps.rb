Then /^I should see a radio button for "(.*?)"$/ do |value|
  # We set visible to false since our radios are styled labels
  expect(page).to have_field("option", with: value, visible: false)
end

Then /^I should see a continue button$/ do
  # We set visible to false since our radios are styled labels
  expect(page).to have_selector("button", text: "Continue")
end

When /^I choose "(.*?)"$/ do |option|
  choose(option, visible: false)
  click_button "Continue"
end

Then /^I should be redirected to "(.*?)"$/ do |url_or_path|
  if url_or_path.start_with?('http')
    # Some urls do a double redirect, we only care about the URL we end up on.
    wait_until { page.current_url == url_or_path }
    expect(page.current_url).to(eq(url_or_path))
  else
    expect(page.current_path).to(eq(url_or_path))
  end
end
