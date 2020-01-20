class GoogleMap
    attr_reader :search_bar, :first_search_item
    def initialize
        @search_bar = {:name => "q"}
        @first_search_item = {:xpath => "(//h3[@class='LC20lb'])[1]"}
    end
end