require 'rails_helper'

RSpec.describe TicketsController, :type => :routing do
  

 it 'routes to #new' do
    expect(get: '/events/1/tickets/new').to route_to('tickets#new',event_id: "1")
  end

  it 'route to #user_tickets' do
    expect(get: 'user_tickets').to route_to('tickets#user_tickets')
  end

end
  