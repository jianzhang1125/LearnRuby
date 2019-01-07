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

        Rails.logger.debug( "Index Page, events count:" + @events.count.to_s )
        Rails.logger.debug( "event : #{@events.inspect}")


        respond_to do |format|
            # Read the default template, index.html.erb
            format.html

            # Here, we use the @events object and transfer the data to xml format
            format.xml {
                render :xml => @events.to_xml
            }

            # Format the JSON
            format.json {
                render :json => @events.to_json
            }

            # This format will use the index.atom.builder template
            format.atom {
                @feed_title = "My event list"
            }
        end
    end

    # GET /events/:id
    def show
        @page_title = @event.name

        respond_to do |format|
            format.html {
                @page_title = @event.name
            }
            format.xml
            format.json {
                render :json => {id:@event.id, name:@event.name, Created_Time:@event.created_at}.to_json
            }
        end
    end

    # GET /events/new
    def new
        # Init an empty event
        @event = Event.new
    end

    # POST /events
    def create
        @event = Event.new( event_params )

        # Before, we will redirect_to the index, right now, we can render page
        # @event.save
        # redirect_to :action => :index

        # Right now, we will render to the new.html.erb
        if @event.save
            # Add a new flash message
            flash[:notice] = "Success to add new event!"

            redirect_to events_path
        else
            render :action => :new
        end

    end

    # GET /events/:id/edit
    def edit
    end

    # PATCH /events/:id
    def update
        @event.update( event_params )

        if @event.save
            # Add a new flash message
            flash[:notice] = "Success to change event!"

            redirect_to event_path(@event)
        else
            render :action => :edit
        end

    end

    # DELETE /events/:id
    def destroy
        @event.destroy
        # Add a new flash message
        flash[:alert] = "The event is deleted."
        redirect_to events_path
    end


    def event_params
        params.require(:event).permit(:name, :description)
    end

    private :event_params
end
