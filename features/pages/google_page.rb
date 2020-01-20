require_relative 'base_page.rb'
require_relative '../maps/google_map.rb'

class GooglePage < BasePage
    attr_reader :google_map
    def initialize(driver)
        super(driver)
        @google_map = GoogleMap.new
    end

    def search_on_home_page(string)
        send_keys_to(@google_map.search_bar, string)
        save_screenshot('typed_search')
        send_keys_to(@google_map.search_bar, :return)
    end

    def rails_search
        result = element_has_text(@google_map.first_search_item,"A web-application framework that includes")
        save_screenshot('search_done')
        result        
    end
end

