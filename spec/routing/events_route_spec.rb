require 'rails_helper'

RSpec.describe EventsController, :type => :routing do
  it 'routes to #index' do
    expect(get: '/events').to route_to('events#index')
  end

 it 'routes to #new' do
    expect(get: '/events/new').to route_to('events#new')
  end

  it 'routes to #edit' do
    expect(get: '/events/7/edit').to route_to('events#edit', id: "7")
  end

  it 'routes to #show' do
    expect(get: '/events/7').to route_to('events#show', id: "7")
  end

  it 'route to #user_events' do
    expect(get: 'user_events').to route_to('events#get_user_events')
  end

end
