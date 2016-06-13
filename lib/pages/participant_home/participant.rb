# frozen_string_literal: true
module ParticipantHome
  # page object for Participants
  class Participant
    include Capybara::DSL

    def initialize(participant)
      @email = participant[:email]
      @password = participant[:password]
    end

    def sign_in
      visit ENV['Base_URL']
      fill_in 'user[email]', with: @email
      fill_in 'user[password]', with: @password
      click_on 'Sign In'
    end

    def sign_out
      click_on 'SIGN OUT'
    end

    def return_home
      click_on 'Home'
    end

    def has_todo_list?
      has_text? 'To-do list'
    end

    def has_todo_list_count?(num)
      item_key = num == 1 ? 'item' : 'items'
      has_text? "You have #{num} #{item_key} on your to-do list"
    end

    def has_completed_todo_items?
      has_css?('.complete', text: "Participant's #2 assignment (',')")
    end

    def has_incomplete_items_todo?
      has_css?('.not-complete', text: "Participant's #1 assignment (',')") &&
        has_css?('.not-complete', text: 'Complete Exercise Log')
    end
  end
end
