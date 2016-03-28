require 'rails_helper'

RSpec.describe EventsController, type: :controller do
	describe "GET :show" do
		before do
			@event = Event.create!(name: "Britney Spears",
				extended_html_description: "This is the biggest event of the year",
				venue: Venue.new,
				category: Category.new,
				starts_at: 1.week.from_now)

			@event_slug = "#{@event.id}-britney-spears" 
		end

		it "load successfuly" do
			get :show, id: @event_slug
			expect(response).to be_success
		end

		it "load successfuly" do
			get :show, id: @event_slug
			expect(response).to render_template 'show'
		end

		it "load the correct event" do
			get :show, id: @event_slug
			expect(assigns(:event)).to eq @event 

		end

	end
end
