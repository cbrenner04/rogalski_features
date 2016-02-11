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
    expect(participant_audio_exercise).to have_correct_hints
    participant_audio_exercise.start_audio_record
    sleep(1)
    participant_audio_exercise.stop_audio_record
    participant_audio_exercise.finish

    # complete exercise log at the end of exercise
    exercise_log.complete # getting hung up here
    expect(exercise_log).to be_submitted
    exercise_log.close_modal
    expect(home).to be_visible

    # check admin dashboard for data of completed audio deck
    participant_4.sign_out
    admin.sign_in
    admin.open_responses
    expect(audio_response).to be_present
  end
end
