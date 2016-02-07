# filename: ./spec/features/decks_spec.rb

require './spec/support/decks_helper.rb'

feature 'Decks' do
  scenario 'Admin creates an audio deck' do
    admin_login.sign_in
    audio_deck.open
    audio_deck.add_new
    expect(audio_deck).to be_present

    # sign in as participant and check for audio deck
    dashboard.log_out
    participant_login.sign_in
    expect(participant_audio_exercise).to be_present

    # check exercise for audio cards
    participant_audio_exercise.select_exercise
    expect(participant_audio_exercise).to have_instructions

    participant_audio_exercise.start
    expect(participant_audio_exercise).to be_an_audio_exercise
    expect(participant_audio_exercise).to have_correct_hints
    # cannot finish and do exercise log as I cannot stop recording locally
  end
end
