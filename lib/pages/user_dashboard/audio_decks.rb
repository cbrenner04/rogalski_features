# frozen_string_literal: true
require './lib/pages/user_dashboard/shared_deck'

module UserDashboard
  # page object for Audio decks
  class AudioDecks
    include Capybara::DSL
    include SharedDeckFunctionality

    def initialize(audio_deck)
      @title = audio_deck[:title]
      @user = audio_deck[:user]
      @instructions = audio_deck[:instructions]
      @answer = audio_deck[:answer]
      @hint_1 = audio_deck[:hint_1]
      @hint_2 = audio_deck[:hint_2]
      @hint_3 = audio_deck[:hint_3]
      @deck_type = 'audio'
    end

    def add_new
      add_new_deck do
        find('.ra-filtering-select-input').set(@user)
        find('.control-label', text: 'User').click
        fill_in 'audio_card[answer]', with: @answer
        fill_in 'audio_card[hint_1]', with: @hint_1
        fill_in 'audio_card[hint_2]', with: @hint_2
        fill_in 'audio_card[hint_3]', with: @hint_3
      end
    end
  end
end
