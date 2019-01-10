class EventAttendeesController < ApplicationController

  before_action :set_event
  def index
    @attendees = @event.attendees
  end

  def show
    @attendee = @event.attendees.find( params[:id] )
  end

  def new
    @attendee = @event.attendees.build
    # @attendee = @event.attendees.new
  end

  def set_event
    @event = Event.find( params[:event_id] )
  end
  private :set_event
end