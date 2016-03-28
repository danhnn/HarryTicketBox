class TicketsController < ApplicationController
  before_action :get_events, only: [:new,:create]
  before_action :authenticate_user!
  
  def user_tickets
    @tickets = current_user.tickets
  end

  def new
    @ticket = current_user.tickets.build()
  end

  def create
    @ticket = current_user.tickets.build(ticket_params)

    if @ticket.custom_save
      flash[:success] = "Buy ticket success"
      redirect_to new_event_ticket_path @event 
    else
      flash.now[:error] = "Error: #{@ticket.errors.full_messages.to_sentence}"
      render :new
    end
  end

  protected

  def get_events
    @event = Event.find(params[:event_id])
  end

  def ticket_params
    params.require(:ticket).permit(:quantity, :price, :ticket_type_id);
  end
end
