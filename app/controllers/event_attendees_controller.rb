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

  def create
    @attendee = @event.attendees.build( attendee_params )
    if @attendee.save
      redirect_to event_attendees_path
    else
      render :action => "new"
    end
  end

  def edit
    @attendee = @event.attendees.find( params[:id] )
  end

  def update
    @attendee = @event.attendees.find( params[:id] )
    if @attendee.update( attendee_params )
      redirect_to event_attendees_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @attendee = @event.attendees.find( params[:id] )
    @attendee.destroy
    # Add a new flash message
    flash[:alert] = "The attendee is deleted."
    redirect_to event_attendees_path
  end

  def attendee_params
    params.require(:attendee).permit(:name)
  end

  def set_event
    @event = Event.find( params[:event_id] )
  end
  private :set_event, :attendee_params
end
