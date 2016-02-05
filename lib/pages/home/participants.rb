# page object
class Home
  # for Participants
  class Participants
    include Capybara::DSL

    def open_session
      find('#next-session').click
    end

    def has_session?(hash)
      within('.simplemodal-container') do
        has_css?('h1', text: hash[:title])
        has_css?('h3', text: hash[:instructions])
      end
    end

    def has_assignment?(hash)
      find('#to-do-list').has_css?(hash[:status], text: hash[:title])
    end
  end
end
