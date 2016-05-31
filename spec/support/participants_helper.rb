# filename: ./spec/support/participants_helper.rb

require './lib/pages/participant_home/participant'
require './lib/pages/participant_home/participants/contact_help'
require './lib/pages/participant_home/participants/calendar'
require './lib/pages/participant_home/participants/connect'

def participant_8
  @participant_8 ||= ParticipantHome::Participant.new(preload_pt_108)
end

def participant_9
  @participant_9 ||= ParticipantHome::Participant.new(preload_pt_109)
end

def participant_10
  @participant_10 ||= ParticipantHome::Participant.new(preload_pt_110)
end

def contact_help
  @contact_help ||= ParticipantHome::Participants::ContactHelp.new
end

def calendar
  @calendar ||= ParticipantHome::Participants::Calendar.new
end

def connect
  @connect ||= ParticipantHome::Participants::Connect.new
end
