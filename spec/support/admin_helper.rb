# filename: ./spec/support/admin_helper.rb

require './lib/pages/user_dashboard/user'
require './lib/pages/user_dashboard/videos'
require './lib/pages/user_dashboard/users/assignments'
require './lib/pages/user_dashboard/users/sessions'
require './lib/pages/participant_home/participant'
require './lib/pages/participant_home/participants/exercises'
require './lib/pages/participant_home/participants/sessions'
require './lib/pages/participant_home/participants/videos'

def user
  UserDashboard::User.new(generic_admin)
end

def add_new_user
  @add_new_user ||= UserDashboard::Users::AddNew.new
end

def new_admin
  UserDashboard::User.new(email: 'fake@example.com', password: 'password')
end

def new_participant
  UserDashboard::User.new(
    email: 'participant_1@example.com',
    display_name: 'Participant 1',
    password: 'password',
    study_id: 'pt1',
    phone: '202-555-0163',
    start_date: Date.today
  )
end

def new_assignment
  UserDashboard::Users::Assignments.new(
    title: 'New assignment',
    user: 'preload_pt_101',
    instructions: 'Assignment Body'
  )
end

def participant_1
  UserDashboard::User.new(preload_pt_101)
end

def participant_exercise
  ParticipantHome::Participants::Exercises.new(
    title: 'New assignment',
    status: 'not-complete'
  )
end

def participant_2
  UserDashboard::User.new(preload_pt_102)
end

def session
  UserDashboard::Users::Sessions.new(
    participant: 'preload_pt_102',
    title: 'New session',
    start_time: Time.now + (1 * 60 * 60 * 24),
    end_time: Time.now + (1 * 60 * 60 * 24) + (1 * 60 * 60),
    instructions: 'Session Instructions'
  )
end

def participant_session
  ParticipantHome::Participants::Sessions.new(
    title: 'New session',
    instructions: 'Session Instructions'
  )
end

def participant_3
  UserDashboard::User.new(preload_pt_103)
end

def pt_3
  ParticipantHome::Participant.new(preload_pt_103)
end

def video
  UserDashboard::Videos.new(
    video_url: 'https://vimeo.com/164554825',
    title: 'New Video',
    description: 'Video description',
    resource: 'Video resource'
  )
end

def participant_video
  ParticipantHome::Participants::Videos.new(
    title: 'New Video',
    description: 'Video description'
  )
end
