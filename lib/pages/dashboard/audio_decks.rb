require './lib/pages/dashboard/users/assignments'
require './lib/pages/dashboard/audio_decks/audio_cards'

class Dashboard
  # page object for Audio decks
  class AudioDecks
    include Capybara::DSL

    def initialize(audio_deck)
      @title = audio_deck[:title]
      @user = audio_deck[:user]
      @instructions = audio_deck[:instructions]
      @answer = audio_deck[:answer]
      @hint_1 = audio_deck[:hint_1]
      @hint_2 = audio_deck[:hint_2]
      @hint_3 = audio_deck[:hint_3]
    end

    def open
      find('.sidebar-nav').find('a', text: 'Audio decks').click
    end

    def add_new
      click_on 'Add new'
      fill_in 'audio_deck[title]', with: @title
      new_assignment.create_assignment
      all('input')[1].set(@title)
      all('.user_field')[1]
        .find('.ra-filtering-select-input')
        .set(@user)
      find('.ui-menu-item', text: @user).click
      audio_card.add_new
      sleep(1)
      click_on 'Save'
      sleep(1)
    end

    def present?
      [@title, @user].each { |i| has_css?('tr', text: i) }
    end

    private

    def new_assignment
      @new_assignment ||= Dashboard::Users::Assignments.new(
        user: @user,
        instructions: @instructions,
        title: @title)
    end

    def audio_card
      @audio_card ||= Dashboard::AudioDecks::AudioCards.new(
        user: @user,
        answer: @answer,
        hint_1: @hint_1,
        hint_2: @hint_2,
        hint_3: @hint_3)
    end
  end
end
