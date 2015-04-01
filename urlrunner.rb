require 'csv'
require 'json'
require 'watir-webdriver'

browser = Watir::Browser.new(:chrome)

a = []

browser.goto "https://www.yorusite.com/login"
browser.text_field(:name => 'username').set 'test_account_email'
browser.text_field(:name => 'password').set 'test_account_password'
browser.button(:id => 'login').click

browser.div(:id => 'object-on-login-success-page').wait_until_present

count = 0

CSV.foreach("siteurls.csv") do |row|
  begin
    browser.goto(row[0])
    cookies = browser.cookies.to_a

    b = Hash.new
    b = cookies

    puts row

    a.push(b)

  rescue
    retry
  end
  #count += 1
  #break if count == 10
end

# Remove Duplicates
#c = a.flatten.uniq

# Remove all Duplicates based on the name of the cookie.
c = a.flatten.uniq! { |a| a[:name] }

puts c

out = Hash.new
out[:out] = c

File.open("cookies.json", 'w') do |file|
  file.write(JSON.generate(out))
end
