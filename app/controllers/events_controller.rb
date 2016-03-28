class EventsController < ApplicationController
  
  before_action :get_events, only: [:edit,:update]
  before_action :authenticate_user!, only: [:new , :create, :get_user_events, :update]

  def index
    @events = Event.upcoming(params[:search])    
  end

  def get_user_events
    @events = current_user.events
    render 'user_events'
  end

  def new
  	@event = Event.new
  	#@event.ticket_types.build
  end
  
  def create
  	@event = current_user.events.build event_params

  	if @event.save
  		flash[:success] = "Create event success"
  		redirect_to user_events_path
  	else
  		flash.now[:error] = "Error: #{@event.errors.full_messages.to_sentence}"
		  render :new
  	end	
  end

  def set_publish
    @event = Event.find(params[:id])
    @event.published = true
    if @event.save
      flash[:success] = "Event has been published"
      redirect_to user_events_path
    else
      flash[:error] = "Error: #{@event.errors.full_messages.to_sentence}"
      redirect_to user_events_path 
    end 
  end

  def update
    # This is my trick for delete_all before update. Actually, we don't let user remove old ticket
    # because that ticket could be bought by other before and we just need to update the new one only.
    @event.ticket_types.delete_all
    
    if @event.update(event_params)
      flash[:success] = "Create event success"
      redirect_to user_events_path
    else
      flash.now[:error] = "Error: #{@event.errors.full_messages.to_sentence}"
      render :edit
    end
  end

  def show
    @event = Event.find(params[:id].to_i)
  end

  private

  def get_events
    @event = Event.find(params[:id])
  end

  def event_params
  	params.require(:event).permit(:name, :starts_at, :ends_at, :hero_image_url,
                                  :extended_html_description, :venue_id, :category_id,
                                  ticket_types_attributes: [:name, :price, :max_quantity,:_destroy])
  end
end
