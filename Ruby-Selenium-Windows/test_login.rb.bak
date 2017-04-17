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

Selenium::WebDriver::PhantomJS.driver_path=cwd+"/bin/phantomjs"
driver = Selenium::WebDriver.for :phantomjs

tries =0
login_successful = "0"

puts "Started login"

while login_successful == "0" do
  driver.get "https://www.trendmls.com/Default.aspx"
  if tries == 0
    driver.manage.window.maximize
  end
  #driver.set_page_load_timeout(60000)
  wait = Selenium::WebDriver::Wait.new(:timeout => 2)
  text_area = driver.find_element(:id, "ctl00_cb_txtTrendLoginName")
  text_area.clear()
  text_area.send_keys(username)
  text_area = driver.find_element(:id, "ctl00_cb_txtTrendPassword")
  text_area.clear()
  text_area.send_keys(passw)
  text_area = driver.find_element(:id, "ctl00_cb_btnLogin")
  text_area.click()
  driver.save_screenshot(cwd +'/screenshot.png')
  tries = tries + 1
  cwd = driver.page_source
  if cwd.include? "logout"
    puts "Success"
    break
  else
    puts "No Success"
    break
  end
end

driver.quit