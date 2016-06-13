# frozen_string_literal: true
# filename: ./spec/support/decks_helper.rb

require './lib/pages/user_dashboard/user'
require './lib/pages/user_dashboard/audio_decks'
require './lib/pages/user_dashboard/multisyllabic_decks'
require './lib/pages/user_dashboard/picture_decks'
require './lib/pages/user_dashboard/users/responses'
require './lib/pages/participant_home/participant'
require './lib/pages/participant_home/participants/exercises'

def participant_4
  @participant_4 ||= ParticipantHome::Participant.new(preload_pt_104)
end

def participant_5
  @participant_5 ||= ParticipantHome::Participant.new(preload_pt_105)
end

def participant_6
  @participant_6 ||= ParticipantHome::Participant.new(preload_pt_106)
end

def audio_deck
  UserDashboard::AudioDecks.new(
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
  UserDashboard::MultiDecks.new(
    title: 'First multisyllabic deck',
    user: 'preload_pt_105',
    instructions: 'Multisyllabic Deck Instructions',
    word: 'antidisestablishmentarianism',
    spelling: 'an-tee-dis-uh-stab-lish-muh n-tair-ee-uh-niz-uh m'
  )
end

def picture_deck
  UserDashboard::PictureDecks.new(
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
  ParticipantHome::Participants::Exercises.new(
    status: 'not-complete',
    title: 'First audio deck',
    instructions: 'Assignment Body',
    hint_1: 'First card Hint 1',
    hint_2: 'First card Hint 2',
    hint_3: 'First card Hint 3'
  )
end

def participant_multi_exercise
  ParticipantHome::Participants::Exercises.new(
    status: 'not-complete',
    title: 'First multisyllabic deck',
    instructions: 'Multisyllabic Deck Instructions',
    word: 'antidisestablishmentarianism',
    spelling: 'an-tee-dis-uh-stab-lish-muh n-tair-ee-uh-niz-uh m'
  )
end

def participant_picture_exercise
  ParticipantHome::Participants::Exercises.new(
    status: 'not-complete',
    title: 'First picture deck',
    instructions: 'Picture Deck Instructions',
    hint_1: 'Flash card hint 1',
    hint_2: 'Flash card hint 2',
    hint_3: 'Flash card hint 3'
  )
end

def audio_response
  UserDashboard::Users::Responses.new(
    user: 'preload_pt_104',
    card: 'First',
    answer: 'Audio Answer [Download]'
  )
end

def multi_response
  UserDashboard::Users::Responses.new(
    user: 'preload_pt_105',
    card: 'antidisestablishmentarianism',
    answer: 'Multisyllabic Answer [Download]'
  )
end

def picture_response
  UserDashboard::Users::Responses.new(
    user: 'preload_pt_106',
    card: 'First flash card answer',
    answer: 'Example Answer'
  )
end
