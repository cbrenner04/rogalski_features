# frozen_string_literal: true
require './lib/pages/user_dashboard/shared_deck'

module UserDashboard
  # page object for picture decks
  class PictureDecks
    include Capybara::DSL
    include SharedDeckFunctionality

    def initialize(picture_deck)
      @title ||= picture_deck[:title]
      @user ||= picture_deck[:user]
      @instructions ||= picture_deck[:instructions]
      @answer ||= picture_deck[:answer]
      @hint_1 ||= picture_deck[:hint_1]
      @hint_2 ||= picture_deck[:hint_2]
      @hint_3 ||= picture_deck[:hint_3]
      @deck_type = 'picture'
    end

    def add_new
      add_new_deck do
        fill_in 'flash_card[answer]', with: @answer
        fill_in 'flash_card[hint_1]', with: @hint_1
        fill_in 'flash_card[hint_2]', with: @hint_2
        fill_in 'flash_card[hint_3]', with: @hint_3
      end
    end
  end
end
