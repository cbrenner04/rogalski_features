class Dashboard
  class AudioDecks
    # page object for audio cards
    class AudioCards
      include Capybara::DSL

      def initialize(audio_card)
        @user = audio_card[:user]
        @answer = audio_card[:answer]
        @hint_1 = audio_card[:hint_1]
        @hint_2 = audio_card[:hint_2]
        @hint_3 = audio_card[:hint_3]
      end

      def add_new
        click_on 'Add a new Audio card'
        within('#modal') do
          find('.ra-filtering-select-input').set(@user)
          find('.control-label', text: 'User').click
          fill_in 'audio_card[answer]', with: @answer
          fill_in 'audio_card[hint_1]', with: @hint_1
          fill_in 'audio_card[hint_2]', with: @hint_2
          fill_in 'audio_card[hint_3]', with: @hint_3
          click_on 'Save'
        end
      end
    end
  end
end
