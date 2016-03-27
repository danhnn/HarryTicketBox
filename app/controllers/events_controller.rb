class EventsController < ApplicationController
  def index
    @events = Event.upcoming(params[:search])    
  end

  def new
  	@event = Event.new
  	@event.ticket_types.build
  end
  
  def create
  	@event = Event.new event_params

  	if @event.save
  		flash[:success] = "Create event success"
  		redirect_to root_path
  	else
  		flash[:error] = "Error: #{@event.errors.full_messages.to_sentence}"
		redirect_to new_event_path
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
