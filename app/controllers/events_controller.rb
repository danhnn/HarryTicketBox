class EventsController < ApplicationController
  def index
    @events = Event.upcoming(params[:search])    
  end

  def get_user_events
    @events = current_user.events
    render 'user_events'
  end

  def new
  	@event = Event.new
  	@event.ticket_types.build
  end
  
  def create
  	@event = current_user.events.build event_params

  	if @event.save
  		flash[:success] = "Create event success"
  		redirect_to root_path
  	else
  		flash[:error] = "Error: #{@event.errors.full_messages.to_sentence}"
		  #redirect_to new_event_path
  	end	
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.ticket_types.destroy_all
    
    if @event.update(event_params)
      flash[:success] = "Create event success"
      redirect_to root_path
    else
      flash[:error] = "Error: #{@event.errors.full_messages.to_sentence}"
      #redirect_to new_event_path
    end
  end

  def show
    @event = Event.find(params[:id].to_i)
  end

  private
  def event_params
  	params.require(:event).permit(:name, :starts_at, :ends_at, :hero_image_url,
                                  :extended_html_description, :venue_id, :category_id,
                                  ticket_types_attributes: [:name, :price, :max_quantity,:_destroy])
  end
end
