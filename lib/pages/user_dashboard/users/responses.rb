# frozen_string_literal: true
module UserDashboard
  module Users
    # page object for Responses page
    class Responses
      include Capybara::DSL

      def initialize(response)
        @user = response[:user]
        @card = response[:card]
        @answer = response[:answer]
      end

      def present?
        [@user, @card, @answer].all? { |i| has_css?('tr', text: i) }
      end
    end
  end
end
