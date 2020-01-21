require_relative 'base_page.rb'
require_relative '../maps/automationpratice_auth_map.rb'

class AutomationPraticeAuth < BasePage
    attr_reader :a_pratice_map
    def initialize(driver)
        super(driver)
        @a_pratice_map = AutomationPraticeAuthMap.new
    end

    def do_login(email, password)
        send_keys_to(@a_pratice_map.email, email)
        send_keys_to(@a_pratice_map.password, password)
        click_on(@a_pratice_map.sign_in_btn)
    end
end

