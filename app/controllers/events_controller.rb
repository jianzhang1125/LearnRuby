class EventsController < ApplicationController
    # GET /events
    # GET /events/index
    def index
        @events = Event.all
    end

    # GET /events/show/:id
    def show
        @event = Event.find(params[:id])
    end

    # GET /events/new
    def new
        # Init an empty event
        @event = Event.new
    end

    # POST /events/create
    def create
        @event = Event.new( event_params )
        @event.save
        redirect_to :action => :index
    end

    def event_params
        params.require(:event).permit(:name, :description)
    end


    # GET /events/edit/:id
    def edit
        @event = Event.find(params[:id])
    end

    # POST /events/update/:id
    def update
        @event = Event.find(params[:id])
        @event.update( event_params )
        @event.save

        redirect_to :action => :show, :id => @event
    end

    # GET /events/destroy/:id
    def destroy
        @event = Event.find(params[:id])
        @event.destroy
        redirect_to :action => :index
    end


    private :event_params
end
