require 'rails_helper'

RSpec.describe Event, type: :model do
	let(:event)  {event = Event.new}

	describe "#venue_name" do
		it "return nil if there's no venue" do
			expect(event.venue_name).to be_nil
		end
  
		it "return venue's name if there's a venue" do
			event.venue = Venue.new(name: "RMIT")
			expect(event.venue_name).to eq "RMIT"
		end
	end 
         
	describe "#upcoming" do
		it	"return zero event upcoming if all is past event" do
			event = create(:event,:in_the_past)
			events = Event.upcoming("")
			expect(events.count).to eq 0
		end
   
		it	"return event if that event is upcoming" do
			event = create(:event,:in_the_future)
			events = Event.upcoming("")
			expect(events.count).to eq 1
		end
  
	end
end
