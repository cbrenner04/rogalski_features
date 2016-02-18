# filename: ./spec/support/participants_helper.rb

require './lib/pages/home/participants'
require './lib/pages/home/participants/contact_help'
require './lib/pages/home/participants/calendar'
require './lib/pages/home/participants/connect'

def participant_8
  @participant_8 ||= Home::Participants.new(preload_pt_108)
end

def participant_9
  @participant_9 ||= Home::Participants.new(preload_pt_109)
end

def participant_10
  @participant_10 ||= Home::Participants.new(preload_pt_110)
end

def contact_help
  @contact_help ||= Home::Participants::ContactHelp.new
end

def calendar
  @calendar ||= Home::Participants::Calendar.new
end

def connect
  @connect ||= Home::Participants::Connect.new
end
