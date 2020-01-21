class AutomationPraticeAuthMap
    attr_reader :email, :password, :sign_in_btn
    def initialize
        @email = {:id => "email"}
        @password = {:id => "passwd"}
        @sign_in_btn = {:id => "SubmitLogin"}
    end
end