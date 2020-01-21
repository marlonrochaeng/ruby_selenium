Given("I am on automationpractice homepage") do
    @automation_home = AutomationPraticeHome.new(@driver)
    @automation_home.go_to("http://automationpractice.com/index.php")
end
  
Given("I do a login with {string} and {string}") do |email, pass|
    @automation_home.click_on_sign_in
    @automation_auth = AutomationPraticeAuth.new(@driver)
    @automation_auth.do_login(email, pass)
end
  
Then("I should be able to see my account page") do
    @automation_auth = MyAccount.new(@driver)
    expect(@automation_auth.verify_logged).to eql(true)
end