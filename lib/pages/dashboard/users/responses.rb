class Dashboard
  class Users
    # page object for Responses page
    class Responses
      include Capybara::DSL

      def open
        find('.nav-list').find('a', text: 'Responses').click
      end

      def has_response?(response)
        response.default = ''
        [response[:user], response[:card], response[:answer]].each do |i|
          has_css?('tr', text: i)
        end
      end
    end
  end
end
