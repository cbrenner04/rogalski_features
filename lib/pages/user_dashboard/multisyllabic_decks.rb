# frozen_string_literal: true
require './lib/pages/user_dashboard/shared_deck'
require './lib/pages/user_dashboard/users/assignments'

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

    def edit
      sleep(1)
      visit "#{ENV['Base_URL']}/admin/multisyllabic_deck/1/edit"
    end

    def assign
      click_on 'Add a new Assignment'
      sleep(1)
      find('#multisyllabic_deck_assignment_attributes_title').set(@title)
      execute_script('window.scrollBy(0,250)')
      first('.dropdown-toggle').click
      find('a', text: @user).click
      within_frame(find('.wysihtml5-sandbox')) do
        find('body').set(@instructions)
      end
      sleep(0.5)
      click_on 'Save'
    end

    private

    def new_assignment
      @new_assignment ||= UserDashboard::Users::Assignments.new(
        user: @user,
        instructions: @instructions,
        title: @title
      )
    end
  end
end
