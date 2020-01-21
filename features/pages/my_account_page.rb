require_relative 'base_page.rb'
require_relative '../maps/my_account_map.rb'

class MyAccount < BasePage
    attr_reader :a_pratice_map
    def initialize(driver)
        super(driver)
        @a_pratice_map = MyAccountMap.new
    end

    def verify_logged
        get_elements(@a_pratice_map.user_field).length > 0 and get_text(@a_pratice_map.my_account_field).include?("MY ACCOUNT")
    end
end

