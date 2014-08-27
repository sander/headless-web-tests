require 'capybara'
require 'capybara/dsl'
require 'capybara/webkit'

#Capybara.javascript_driver = :webkit
#Capybara.visit 'http://localhost:3000/'

Capybara.default_driver = :webkit
Capybara.run_server = false
Capybara.app_host = 'http://localhost:3000'

module MyTest
  class Test
    include Capybara::DSL
    def test_home
      visit('/')
      #save_and_open_page
      page.save_screenshot 'screenshot.png'
      #save_and_open_screenshot
    end
  end
end

#session = Capybara::Session.new :webkit, 

#visit 'http://localhost:3000/'

t = MyTest::Test.new
t.test_home
