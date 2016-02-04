# page object
class Home
  # for participants page
  class Participant
    include Capybara::DSL

    def visible?
      has_css?('h4', text: 'Welcome to Communication Bridge')
    end
  end
end
