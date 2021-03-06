# frozen_string_literal: true
# filename: ./spec/features/decks_spec.rb

require './spec/support/decks_helper.rb'

feature 'Decks' do
  scenario 'Admin creates an audio deck' do
    admin.sign_in
    audio_deck.open
    audio_deck.add_new
    expect(audio_deck).to be_present

    # sign in as participant and check for audio deck
    admin.log_out
    participant_4.sign_in
    expect(participant_audio_exercise).to be_present

    # check exercise to confirm audio deck / cards
    participant_audio_exercise.select_exercise
    expect(participant_audio_exercise).to have_instructions
    participant_audio_exercise.start
    expect(participant_audio_exercise).to be_an_audio_exercise
    expect(participant_audio_exercise).to have_correct_audio_hints
    participant_audio_exercise.start_audio_record
    sleep(2)
    participant_audio_exercise.stop_audio_record
    participant_audio_exercise.finish

    expect(home).to be_visible

    # check admin dashboard for data of completed audio deck
    participant_4.sign_out
    admin.sign_in
    admin.open_responses
    expect(audio_response).to be_present
  end

  scenario 'Admin creates a multisyllabic deck' do
    admin.sign_in
    multi_deck.open
    multi_deck.add_new
    expect(multi_deck).to be_present

    # sign in as participant and check for multisyllabic deck
    admin.log_out
    participant_5.sign_in
    expect(participant_multi_exercise).to be_present

    # check exercise to confirm multisyllabic deck / cards
    participant_multi_exercise.select_exercise
    expect(participant_multi_exercise).to have_instructions
    participant_multi_exercise.start
    expect(participant_multi_exercise).to be_a_multi_exercise
    participant_multi_exercise.start_audio_record
    sleep(2)
    participant_multi_exercise.stop_audio_record
    participant_multi_exercise.finish

    expect(home).to be_visible

    # check admin dashboard for data of completed multisyllabic deck
    participant_5.sign_out
    admin.sign_in
    admin.open_responses
    expect(multi_response).to be_present
  end

  scenario 'User completes an audio deck with more than 6 slides' do
    admin.sign_in
    multi_deck_2.open
    multi_deck_2.edit
    multi_deck_2.assign
    admin.log_out

    participant_201.sign_in
    expect(participant_second_multi_exercise).to be_present

    participant_second_multi_exercise.select_exercise
    expect(participant_second_multi_exercise).to have_instructions
    participant_second_multi_exercise.start
    7.times do
      participant_second_multi_exercise.start_audio_record
      sleep(2)
      participant_second_multi_exercise.stop_audio_record
      participant_second_multi_exercise.next
    end
    participant_second_multi_exercise.start_audio_record
    sleep(2)
    participant_second_multi_exercise.stop_audio_record
    participant_second_multi_exercise.finish

    expect(home).to be_visible
  end

  scenario 'Admin creates a picture deck' do
    admin.sign_in
    picture_deck.open
    picture_deck.add_new
    expect(picture_deck).to be_present

    # sign in as participant and check for picture deck
    admin.log_out
    participant_6.sign_in
    expect(participant_picture_exercise).to be_present

    # check exercise to confirm picture deck / flash card
    participant_picture_exercise.select_exercise
    expect(participant_picture_exercise).to have_instructions
    participant_picture_exercise.start
    expect(participant_picture_exercise).to be_a_picture_exercise
    expect(participant_picture_exercise).to have_correct_picture_hints
    participant_picture_exercise.answer
    participant_picture_exercise.finish

    expect(home).to be_visible

    # check admin dashboard for data of completed multisyllabic deck
    participant_6.sign_out
    admin.sign_in
    admin.open_responses
    expect(picture_response).to be_present
  end
end
