class EventsController < ApplicationController

    # Before action to get the event by id
    before_action :get_event_by_id, :only => [:show, :edit, :update, :destroy]

    def get_event_by_id
        @event = Event.find(params[:id])
    end

    # GET /events
    # GET /events/index
    def index
        # No longer get all the data
        # @events = Event.all
        @events = Event.page( params[:page] ).per(5)
    end

    # GET /events/show/:id
    def show
        @page_title = @event.name
    end

    # GET /events/new
    def new
        # Init an empty event
        @event = Event.new
    end

    # POST /events/create
    def create
        @event = Event.new( event_params )

        # Before, we will redirect_to the index, right now, we can render page
        # @event.save
        # redirect_to :action => :index

        # Right now, we will render to the new.html.erb
        if @event.save
            # Add a new flash message
            flash[:notice] = "Success to add new event!"

            redirect_to :action => :index
        else
            render :action => :new
        end

    end

    # GET /events/edit/:id
    def edit
    end

    # POST /events/update/:id
    def update
        @event.update( event_params )

        if @event.save
            # Add a new flash message
            flash[:notice] = "Success to change event!"

            redirect_to :action => :show, :id => @event
        else
            render :action => :edit
        end

    end

    # GET /events/destroy/:id
    def destroy
        @event.destroy
        # Add a new flash message
        flash[:alert] = "The event is deleted."
        redirect_to :action => :index
    end


    def event_params
        params.require(:event).permit(:name, :description)
    end

    private :event_params
end
