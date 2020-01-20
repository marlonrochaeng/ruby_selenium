require 'selenium-webdriver'

class BasePage
    attr_accessor :driver
    def initialize(driver)
        @driver = driver
    end

    def driver
        @driver
    end

    def go_to(url)
        @driver.get url
    end

    def driver=(driver)
        @driver = driver
    end

    def wait_for(seconds=10)
        Selenium::WebDriver::Wait.new(:timeout => seconds).until{ yield }
    end

    def wait_element(element)
        wait_for{ @driver.find_element(element).displayed?}
        @driver.find_element(element)
    end

    def click_on(element)
        el = wait_element(element)
        el.click
    end

    def send_keys_to(element, text) 
        el = wait_element(element)
        el.send_keys text
    end

    def element_has_text(element,text)
        el = wait_element(element)
        el.text.include?(text)
    end

    def save_screenshot(screenshot_name)
        Dir.mkdir(ENV['folder_name']) unless File.exists?(ENV['folder_name'])
        @driver.save_screenshot(ENV['folder_name']+screenshot_name+'.png')
    end
end