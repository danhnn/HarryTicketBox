require 'rails_helper'

RSpec.describe "routing to event page", :type => :routing do
  it "routes /events/1-britney-spears to events#show" do
    expect(:get => "/events/1-britney-spears").to route_to(
      :controller => "events",
      :action => "show",
      :id => "1-britney-spears"
    ) 
  end
end