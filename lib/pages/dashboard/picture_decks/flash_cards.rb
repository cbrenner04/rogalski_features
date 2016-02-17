class Dashboard
  class PictureDecks
    # page object for flash cards
    class FlashCards
      include Capybara::DSL

      def initialize(flash_cards)
        @answer ||= flash_cards[:answer]
        @hint_1 ||= flash_cards[:hint_1]
        @hint_2 ||= flash_cards[:hint_2]
        @hint_3 ||= flash_cards[:hint_3]
      end

      def add_new
        click_on 'Add a new Flash card'
        within('#modal') do
          fill_in 'flash_card[answer]', with: @answer
          fill_in 'flash_card[hint_1]', with: @hint_1
          fill_in 'flash_card[hint_2]', with: @hint_2
          fill_in 'flash_card[hint_3]', with: @hint_3
          click_on 'Save'
        end
      end
    end
  end
end
