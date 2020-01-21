class MyAccountMap
    attr_reader :user_field, :my_account_field
    def initialize
        @user_field = {:xpath => "//a[@title='View my customer account']/span"}
        @my_account_field = {:xpath => "//h1[@class='page-heading']"}
    end
end