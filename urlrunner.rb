require 'csv'
require 'json'
require 'watir-webdriver'

browser = Watir::Browser.new(:chrome)

# browser.goto "https://www.yoursite.com/login"
# browser.text_field(name: 'username').set 'test_account_email'
# browser.text_field(name: 'password').set 'test_account_password'
# browser.button(id: 'login').click
# browser.div(id: 'object-on-login-success-page').wait_until_present

cookie_store = []

# 10.times do
  CSV.foreach("siteurls.csv") do |row|
    begin
      url = row.first
      puts url
      browser.goto(url)
      cookie_store.push(browser.cookies.to_a)
    rescue
      retry
    end
  end
# end

browser.close

# Remove Duplicates
# cookie_list = cookie_store.flatten.uniq

# Remove all Duplicates based on the name of the cookie.
cookie_list = cookie_store.flatten.uniq! { |cookie| cookie[:name] }

File.open("cookies.json", 'w') do |file|
  file.write(JSON.generate(cookie_list))
end

puts "Done!"