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
end
