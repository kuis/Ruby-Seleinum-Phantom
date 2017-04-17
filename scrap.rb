# require 'capybara'
# require 'capybara/poltergeist'
# require 'byebug'

# byebug

# describe "security", :type => :feature do
#   it "signs users in" do
#     visit "http://ngauthier.com/"

#     all(".posts .post").each do |post|
#       title = post.find("h3 a").text
#       url   = post.find("h3 a")["href"]
#       date  = post.find("h3 small").text
#       summary = post.find("p.preview").text

#       puts title
#       puts url
#       puts date
#       puts summary
#       puts ""
#     end
#   end
# end


# require "selenium-webdriver"

# driver = Selenium::WebDriver.for :firefox
# driver.navigate.to "http://google.com"

# element = driver.find_element(name: 'q')
# element.send_keys "Hello WebDriver!"
# element.submit

# puts driver.title

# driver.quit


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

# element = driver.find_element :name => "q"
# element.send_keys "Cheese!"
# element.submit

# puts "Page title is #{driver.title}"

# wait = Selenium::WebDriver::Wait.new(:timeout => 10)
# wait.until { driver.title.downcase.start_with? "cheese!" }

# puts "Page title is #{driver.title}"
# driver.quit

# driver.navigate.to "http://google.com"
# driver.window_maximize
# element = driver.find_element(name: 'q')
# element.send_keys "Hello WebDriver!"
# element.submit

# puts driver.title

# driver.quit