class EventsController < ApplicationController
  def index
    @events = Event.upcoming(params[:search])    
  end

  def show
    @event = Event.find(params[:id].to_i)
  end
end
