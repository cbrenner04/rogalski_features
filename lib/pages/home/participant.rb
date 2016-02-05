# page object
class Home
  # for participants page
  class Participant
    include Capybara::DSL

    def visible?
      has_css?('h4', text: 'Welcome to Communication Bridge')
    end

    def has_assignment?(hash)
      find('#to-do-list').has_css?(hash[:status], text: hash[:title])
    end
  end
end
