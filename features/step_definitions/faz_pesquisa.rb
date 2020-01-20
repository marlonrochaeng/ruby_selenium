
Given("I am on google home page") do
    google_page = GooglePage.new(@driver)
    google_page.go_to("https://google.com")
end

Given("I do a search for {string}") do |string|
    google_page = GooglePage.new(@driver)
    google_page.search_on_home_page(string)
end

Then("I should be able to see the response page") do
    google_page = GooglePage.new(@driver)
    expect(google_page.rails_search)
end