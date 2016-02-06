class Home
  # page object for Participants
  class Participants
    include Capybara::DSL

    def open_session
      find('#next-session').click
    end

    def has_session?(session)
      within('.simplemodal-container') do
        has_css?('h1', text: session[:title])
        has_css?('h3', text: session[:instructions])
      end
    end

    def has_assignment?(assignment)
      find('#to-do-list')
        .has_css?(assignment[:status], text: assignment[:title])
    end
  end
end
