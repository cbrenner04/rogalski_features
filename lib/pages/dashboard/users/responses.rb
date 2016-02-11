class Dashboard
  class Users
    # page object for Responses page
    class Responses
      include Capybara::DSL

      def initialize(response)
        @user = response[:user]
        @card = response[:card]
        @answer = response[:answer]
      end

      def present?
        [@user, @card, @answer].each do |i|
          find('tr', text: i)
        end
      end
    end
  end
end
