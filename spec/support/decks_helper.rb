# filename: ./spec/support/decks_helper.rb

require './lib/pages/dashboard'
require './lib/pages/home'
require './lib/pages/dashboard/users'
require './lib/pages/dashboard/audio_decks'
require './lib/pages/dashboard/multisyllabic_decks'
require './lib/pages/dashboard/picture_decks'
require './lib/pages/dashboard/users/responses'
require './lib/pages/home/participants'
require './lib/pages/home/participants/exercises'

def admin
  @admin ||= Dashboard::Users.new(generic_admin)
end

def participant_4
  @participant_4 ||= Home::Participants.new(preload_pt_104)
end

def participant_5
  @participant_5 ||= Home::Participants.new(preload_pt_105)
end

def participant_6
  @participant_6 ||= Home::Participants.new(preload_pt_106)
end

def dashboard
  @dashboard ||= Dashboard.new
end

def home
  @home ||= Home.new
end

def audio_deck
  Dashboard::AudioDecks.new(
    title: 'First audio deck',
    user: 'preload_pt_104',
    instructions: 'Assignment Body',
    answer: 'First',
    hint_1: 'First card Hint 1',
    hint_2: 'First card Hint 2',
    hint_3: 'First card Hint 3'
  )
end

def multi_deck
  Dashboard::MultiDecks.new(
    title: 'First multisyllabic deck',
    user: 'preload_pt_105',
    instructions: 'Multisyllabic Deck Instructions',
    word: 'antidisestablishmentarianism',
    spelling: 'an-tee-dis-uh-stab-lish-muh n-tair-ee-uh-niz-uh m'
  )
end

def picture_deck
  Dashboard::PictureDecks.new(
    title: 'First picture deck',
    user: 'preload_pt_106',
    instructions: 'Picture Deck Instructions',
    answer: 'First flash card answer',
    hint_1: 'Flash card hint 1',
    hint_2: 'Flash card hint 2',
    hint_3: 'Flash card hint 3'
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

def participant_multi_exercise
  Home::Participants::Exercises.new(
    status: 'not-complete',
    title: 'First multisyllabic deck',
    instructions: 'Multisyllabic Deck Instructions',
    word: 'antidisestablishmentarianism',
    spelling: 'an-tee-dis-uh-stab-lish-muh n-tair-ee-uh-niz-uh m'
  )
end

def participant_picture_exercise
  Home::Participants::Exercises.new(
    status: 'not-complete',
    title: 'First picture deck',
    instructions: 'Picture Deck Instructions',
    hint_1: 'Flash card hint 1',
    hint_2: 'Flash card hint 2',
    hint_3: 'Flash card hint 3'
  )
end

def audio_response
  Dashboard::Users::Responses.new(
    user: 'preload_pt_104',
    card: 'First',
    answer: 'Audio Answer [Download]'
  )
end

def multi_response
  Dashboard::Users::Responses.new(
    user: 'preload_pt_105',
    card: 'antidisestablishmentarianism',
    answer: 'Multisyllabic Answer [Download]'
  )
end

def picture_response
  Dashboard::Users::Responses.new(
    user: 'preload_pt_106',
    card: 'First flash card answer',
    answer: 'Example Answer'
  )
end
