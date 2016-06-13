# frozen_string_literal: true
module UserDashboard
  # page object for login events
  class LoginEvents
    include Capybara::DSL

    def open
      first('a', text: 'User login events').click
      sleep(0.5)
    end

    def total_events
      text = find('.total-count').text
      new_text = text.delete(/ user login event[s]?/.to_s)
      new_text.to_i
    end
  end
end
