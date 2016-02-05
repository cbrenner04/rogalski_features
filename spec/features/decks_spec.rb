# filename: ./spec/features/decks_spec.rb

feature 'Decks' do
  background do
    log_in.log_in_as(generic_admin)
  end

  scenario 'Admin creates an audio deck' do
    audio_decks.open
    new_assignment = { title: 'First audio deck', participant: 'preload_pt_4',
                       instructions: 'Assignment Body' }
    new_audio_card = { user: 'preload_pt_4', answer: 'First',
                       hint_1: 'First card Hint 1', hint_2: 'First card Hint 2',
                       hint_3: 'First card Hint 3' }
    new_audio_deck = { title: 'First audio deck', user: 'preload_pt_4',
                       audio_card: new_audio_card, assignment: new_assignment }
    audio_decks.add_new(new_audio_deck)
    expect(audio_decks).to have_deck(new_audio_deck)

    # sign in as participant and check for audio deck
    dashboard.log_out
    log_in.log_in_as(preload_pt_4)
    new_audio_deck[:status] = '.not-complete'
    expect(participants).to have_assignment(new_audio_deck)

    # check exercise for audio cards
    sleep(1)
    participant_exercises.select_exercise(new_audio_deck)
    sleep(1)
    expect(participant_exercises).to have_exercise_instructions(new_assignment)
    participant_exercises.start_exercise
    expect(participant_exercises).to be_an_audio_exercise
    expect(participant_exercises).to have_correct_hints(new_audio_card)
    # cannot finish and do exercise log as I cannot stop recording locally
  end
end
