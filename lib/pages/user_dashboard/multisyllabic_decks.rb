require './lib/pages/user_dashboard/shared_deck'

module UserDashboard
  # page object for multisyllabic decks
  class MultiDecks
    include Capybara::DSL
    include SharedDeckFunctionality

    def initialize(multi_deck)
      @title ||= multi_deck[:title]
      @user ||= multi_deck[:user]
      @instructions ||= multi_deck[:instructions]
      @word ||= multi_deck[:word]
      @spelling ||= multi_deck[:spelling]
      @deck_type = 'multisyllabic'
    end

    def add_new
      add_new_deck do
        find('.ra-filtering-select-input').set(@user)
        find('.control-label', text: 'User').click
        fill_in 'multisyllabic_card[word]', with: @word
        fill_in 'multisyllabic_card[phonetic_transcription]',
                with: @spelling
      end
    end
  end
end
