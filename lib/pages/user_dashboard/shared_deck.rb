require './lib/pages/user_dashboard/users/assignments'

module UserDashboard
  # shared functionality in deck creation
  module SharedDeckFunctionality
    include Capybara::DSL

    def open
      find('.sidebar-nav')
        .find('a', text: "#{@deck_type.capitalize} decks").click
    end

    def add_new_deck
      click_on 'Add new'
      fill_in "#{@deck_type}_deck[title]", with: @title
      new_assignment.create_assignment
      all('input')[1].set(@title)
      all('.user_field')[1]
        .find('.ra-filtering-select-input')
        .set(@user)
      find('.ui-menu-item', text: @user).click
      card_type = @deck_type == 'picture' ? 'Flash' : @deck_type.capitalize
      click_on "Add a new #{card_type} card"
      within('#modal') do
        yield
        click_on 'Save'
      end
      sleep(0.5)
      click_on 'Save'
      sleep(0.5)
    end

    def present?
      [@title, @user].all? { |i| has_css?('tr', text: i) }
    end

    private

    def new_assignment
      @new_assignment ||= UserDashboard::Users::Assignments.new(
        user: @user,
        instructions: @instructions,
        title: @title
      )
    end
  end
end
