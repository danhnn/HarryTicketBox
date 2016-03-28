class VenuesController < ApplicationController
  before_action :authenticate_user!

  def new
  	@venue = Venue.new
  end

  def create
  	@venue = Venue.new venue_params
  	if @venue.save
  		flash[:success] = "New venue has been created"
  		redirect_to new_event_path
  	else
		flash[:error] = "Error: #{@venue.errors.full_messages.to_sentence}"
		render :new
  	end
  end

  private

  def venue_params
  	params.require(:venue).permit(:name,:full_address,:region_id)
  end
end
