require './lib/pages/dashboard/users/assignments'
require './lib/pages/dashboard/picture_decks/flash_cards'

class Dashboard
  # page object for picture decks
  class PictureDecks
    include Capybara::DSL

    def initialize(picture_deck)
      @title ||= picture_deck[:title]
      @user ||= picture_deck[:user]
      @instructions ||= picture_deck[:instructions]
      @answer ||= picture_deck[:answer]
      @hint_1 ||= picture_deck[:hint_1]
      @hint_2 ||= picture_deck[:hint_2]
      @hint_3 ||= picture_deck[:hint_3]
    end

    def open
      find('.sidebar-nav').find('a', text: 'Picture decks').click
    end

    def add_new
      click_on 'Add new'
      fill_in 'picture_deck[title]', with: @title
      new_assignment.create_assignment
      all('input')[1].set(@title)
      all('.user_field')[1]
        .find('.ra-filtering-select-input')
        .set(@user)
      find('.ui-menu-item', text: @user).click
      flash_cards.add_new
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

    def flash_cards
      @flash_cards ||= Dashboard::PictureDecks::FlashCards.new(
        answer: @answer,
        hint_1: @hint_1,
        hint_2: @hint_2,
        hint_3: @hint_3
      )
    end
  end
end
