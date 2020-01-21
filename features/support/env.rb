require 'selenium-webdriver'
require 'cucumber'
require_relative 'utils.rb'

Selenium::WebDriver::Chrome.driver_path = 'chromedriver.exe'

def initialize_driver
    puts "=============================="
    puts "You are running tests in #{ENV['browser']} browser"
    puts "=============================="
    if ENV['browser'].include?('chrome')
        @driver = Selenium::WebDriver.for :chrome
    elsif ENV['browser'].include?('firefox')
        @driver = Selenium::WebDriver.for :firefox
    end
    @driver.manage.window.maximize
    @driver
end

def generate_report(scenario)
    screenshot_files = Dir.entries(ENV['folder_name'])
    screenshot_files = screenshot_files.slice(2,screenshot_files.length)
    report_generator = ReportGenerator.new(scenario.name.to_s.split(',')[0].gsub(' ','_'), 
                        @context[:finish_test_time] - @context[:init_test_time], screenshot_files, scenario.status.to_s)
    report_generator.create_document
    report_generator.method_name
    report_generator.save_document
end


Before do |scenario|
    @context = Hash.new
    @context[:init_test_time] = Time.now
    ENV['folder_name'] = 'evidences/'+@context[:init_test_time].strftime("%d_%m_%Y_%H_%M_%S") +'_'+ scenario.name.to_s.split(',')[0].gsub(' ','_') + '/'
    puts "SCREENSHOT DIRECTORY: #{ENV['folder_name']}"
    @driver = initialize_driver    
end

After do |scenario|
    @context[:finish_test_time] = Time.now
    result = scenario.status.to_s
    generate_report(scenario) unless ENV['generate_evidences'].include?('false')
end