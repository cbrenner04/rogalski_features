# filename: ./spec/support/decks_helper.rb

require './lib/pages/dashboard'
require './lib/pages/home'
require './lib/pages/dashboard/users'
require './lib/pages/dashboard/audio_decks'
require './lib/pages/dashboard/users/responses'
require './lib/pages/home/participants'
require './lib/pages/home/participants/exercises'
require './lib/pages/home/participants/exercise_log'

def admin
  @admin = Dashboard::Users.new(generic_admin)
end

def participant_4
  @participant_4 = Home::Participants.new(preload_pt_4)
end

def dashboard
  @dashboard ||= Dashboard.new
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

def exercise_log
  @exercise_log ||= Home::Participants::ExerciseLog.new
end

def home
  @home ||= Home.new
end

def audio_response
  Dashboard::Users::Responses.new(
    user: 'preload_pt_4',
    card: 'First',
    answer: 'Audio Answer [Download]'
  )
end
