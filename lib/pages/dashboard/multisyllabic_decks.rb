require './lib/pages/dashboard/users/assignments'
require './lib/pages/dashboard/multisyllabic_decks/multisyllabic_cards'

class Dashboard
  # page object for multisyllabic decks
  class MultiDecks
    include Capybara::DSL

    def initialize(multi_deck)
      @title ||= multi_deck[:title]
      @user ||= multi_deck[:user]
      @instructions ||= multi_deck[:instructions]
      @word ||= multi_deck[:word]
      @spelling ||= multi_deck[:spelling]
    end

    def open
      find('.nav-list').find('a', text: 'Multisyllabic decks').click
    end

    def add_new
      click_on 'Add new'
      fill_in 'multisyllabic_deck[title]', with: @title
      new_assignment.create_assignment
      all('input')[1].set(@title)
      all('.user_field')[1]
        .find('.ra-filtering-select-input')
        .set(@user)
      find('.ui-menu-item', text: @user).click
      multi_cards.add_new
      sleep(1)
      click_on 'Save'
    end

    def present?
      [@title, @user].each { |i| find('tr', text: i) }
    end

    private

    def new_assignment
      @new_assignment ||= Dashboard::Users::Assignments.new(
        user: @user,
        instructions: @instructions,
        title: @title
      )
    end

    def multi_cards
      @multi_cards ||= Dashboard::MultiDecks::MultiCards.new(
        user: @user,
        word: @word,
        spelling: @spelling
      )
    end
  end
end
