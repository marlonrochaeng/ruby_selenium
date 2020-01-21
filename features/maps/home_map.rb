class AutomationPraticeHomeMap
    attr_reader :sign_in
    def initialize
        @sign_in = {:xpath => "//a[@class='login']"}
    end
end