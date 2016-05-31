# filename: ./spec/support/weekly_exercise_log_helper.rb

require './lib/pages/user_dashboard/weekly_exercise_logs'
require './lib/pages/participant_home/participant'
require './lib/pages/participant_home/participants/weekly_log'

def participant_7
  @participant_7 ||= ParticipantHome::Participant.new(preload_pt_107)
end

def pt_weekly_log
  ParticipantHome::Participants::WeeklyLog.new
end

def user_weekly_log
  UserDashboard::WeeklyExerciseLogs.new('preload_pt_107')
end
