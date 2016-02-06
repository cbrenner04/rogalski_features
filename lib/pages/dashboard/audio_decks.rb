class Dashboard
  # page object for Audio decks
  class AudioDecks
    include Capybara::DSL

    def open
      find('.nav-list').find('a', text: 'Audio decks').click
    end

    def add_new(audio_deck)
      click_on 'Add new'
      fill_in 'audio_deck[title]', with: audio_deck[:title]
      edit_user.create_assignment(audio_deck[:assignment])
      page.all('input')[1].set(audio_deck[:title])
      page.all('.user_field')[1]
        .find('.ra-filtering-select-input')
        .set(audio_deck[:user])
      add_new_card(audio_deck[:audio_card])
      sleep(1)
      click_on 'Save'
      sleep(1)
    end

    def add_new_card(audio_card)
      click_on 'Add a new Audio card'
      within('#modal') do
        find('.ra-filtering-select-input').set(audio_card[:user])
        fill_in 'audio_card[answer]', with: audio_card[:answer]
        fill_in 'audio_card[hint_1]', with: audio_card[:hint_1]
        fill_in 'audio_card[hint_2]', with: audio_card[:hint_2]
        fill_in 'audio_card[hint_3]', with: audio_card[:hint_3]
        click_on 'Save'
      end
    end

    def has_deck?(audio_deck)
      [audio_deck[:title], audio_deck[:user]].each do |i|
        has_css?('tr', text: i)
      end
    end
  end
end
