require_relative 'base_page.rb'
require_relative '../maps/automationpratice_home_map.rb'

class AutomationPraticeHome < BasePage
    attr_reader :a_pratice_map
    def initialize(driver)
        super(driver)
        @a_pratice_map = AutomationPraticeHomeMap.new
    end

    def click_on_sign_in
        click_on(@a_pratice_map.sign_in)
    end
end

