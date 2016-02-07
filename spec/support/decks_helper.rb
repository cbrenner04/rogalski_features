# filename: ./spec/support/decks_helper.rb

require './lib/pages/log_in'
require './lib/pages/dashboard'
require './lib/pages/dashboard/audio_decks'
require './lib/pages/home/participants/exercises'

def admin_login
  LogIn.new(generic_admin)
end

def participant_login
  LogIn.new(preload_pt_4)
end

def dashboard
  Dashboard.new
end

def audio_deck
  Dashboard::AudioDecks.new(
    title: 'First audio deck',
    user: 'preload_pt_4',
    instructions: 'Assignment Body',
    answer: 'First',
    hint_1: 'First card Hint 1',
    hint_2: 'First card Hint 2',
    hint_3: 'First card Hint 3'
  )
end

def participant_audio_exercise
  Home::Participants::Exercises.new(
    status: 'not-complete',
    title: 'First audio deck',
    instructions: 'Assignment Body',
    hint_1: 'First card Hint 1',
    hint_2: 'First card Hint 2',
    hint_3: 'First card Hint 3'
  )
end
