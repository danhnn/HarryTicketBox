class EventsController < ApplicationController
  def index
    @events = Event.upcoming    
  end

  def show
    @event = Event.find(params[:id].to_i)
  end
end
