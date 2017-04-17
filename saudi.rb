require 'rubygems'
require 'selenium-webdriver'
# Selenium::WebDriver::Chrome.driver_path="/home/ubuntu1404/Workspaces/Ruby-Selenium/bin/chromedriver"
# driver = Selenium::WebDriver.for :chrome

puts "Enter UserName"
username = gets.chomp
puts "Enter Password"
passw = gets.chomp
cwd = Dir.pwd
puts "(" + username + "," + passw + ")"

# Selenium::WebDriver::PhantomJS.driver_path=cwd+"/bin/phantomjs"
# driver = Selenium::WebDriver.for :phantomjs

profile = Selenium::WebDriver::Chrome::Profile.new
profile.assume_untrusted_certificate_issuer = true

Selenium::WebDriver::Chrome.driver_path=cwd+"/bin/chromedriver"
driver = Selenium::WebDriver.for :chrome, profile: profile



driver.navigate.to "http://www.saudia.com/"

btnGo = driver.find_element(:id, "search-for-flights-go")

btnGo = wait.until {
    element = driver.find_element(:id, "search-for-flights-go")
    element if element.displayed?
}

btnGo.click()
driver.save_screenshot(cwd +'/screenshot.png')

cwd = driver.page_source
if cwd.include? "logout"
  puts "Success"
else
  puts "No Success"
end


driver.quit