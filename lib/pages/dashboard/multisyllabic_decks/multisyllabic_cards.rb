class Dashboard
  class MultiDecks
    # page object for multisyllabic cards
    class MultiCards
      include Capybara::DSL

      def initialize(multi_cards)
        @user ||= multi_cards[:user]
        @word ||= multi_cards[:word]
        @spelling ||= multi_cards[:spelling]
      end

      def add_new
        click_on 'Add a new Multisyllabic card'
        within('#modal') do
          find('.ra-filtering-select-input').set(@user)
          find('.control-label', text: 'User').click
          fill_in 'multisyllabic_card[word]', with: @word
          fill_in 'multisyllabic_card[phonetic_transcription]',
                  with: @spelling
          click_on 'Save'
        end
      end
    end
  end
end
