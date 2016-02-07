# filename: ./spec/support/admin_helper.rb

require './lib/pages/log_in'
require './lib/pages/dashboard'
require './lib/pages/home'
require './lib/pages/dashboard/users'
require './lib/pages/dashboard/videos'
require './lib/pages/dashboard/users/assignments'
require './lib/pages/dashboard/users/sessions'
require './lib/pages/home/participants'
require './lib/pages/home/participants/exercises'
require './lib/pages/home/participants/sessions'
require './lib/pages/home/participants/videos'

def admin_login
  LogIn.new(generic_admin)
end

def dashboard
  Dashboard.new
end

def user
  Dashboard::Users.new(generic_admin)
end

def add_new_user
  Dashboard::Users::AddNew.new
end

def home
  Home.new
end

def new_admin_creds
  { email: 'fake@example.com', password: 'password' }
end

def new_admin
  Dashboard::Users.new(new_admin_creds)
end

def new_admin_login
  LogIn.new(new_admin_creds)
end

def new_participant_info
  { email: 'participant_1@example.com',
    display_name: 'Participant 1',
    password: 'password',
    study_id: 'pt1',
    phone: '202-555-0163',
    start_date: Date.today }
end

def new_participant
  Dashboard::Users.new(new_participant_info)
end

def new_participant_login
  LogIn.new(new_participant_info)
end

def new_assignment
  Dashboard::Users::Assignments.new(
    title: 'New assignment',
    user: 'preload_pt_1',
    instructions: 'Assignment Body'
  )
end

def participant_1
  Dashboard::Users.new(
    study_id: 'preload_pt_1',
    assignment: 'New assignment'
  )
end

def participant_1_login
  LogIn.new(preload_pt_1)
end

def participant_exercise
  Home::Participants::Exercises.new(
    title: 'New assignment',
    status: 'not-complete'
  )
end

def participant_2
  Dashboard::Users.new(
    study_id: 'preload_pt_2',
    session: 'New session'
  )
end

def session
  Dashboard::Users::Sessions.new(
    participant: 'preload_pt_2',
    title: 'New session',
    start_date: Date.today + 1,
    start_time: Time.now,
    end_date: Date.today + 1,
    end_time: Time.now + (60 * 60),
    instructions: 'Session Instructions'
  )
end

def participant_2_login
  LogIn.new(preload_pt_2)
end

def participant_session
  Home::Participants::Sessions.new(
    title: 'New session',
    instructions: 'Session Instructions'
  )
end

def participant_3
  Dashboard::Users.new(
    study_id: 'preload_pt_3',
    video: 'New Video'
  )
end

def video
  Dashboard::Videos.new(
    video_url: 'fake/url/',
    title: 'New Video',
    description: 'Video description',
    resource: 'Video resource'
  )
end

def participant_3_login
  LogIn.new(preload_pt_3)
end

def participant_video
  Home::Participants::Videos.new(
    title: 'New Video',
    description: 'Video description'
  )
end
