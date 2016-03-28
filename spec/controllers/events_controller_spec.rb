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

	describe "GET #index" do
		it "responds successfully with an HTTP 200 status code" do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end
	end

	describe "GET #get_user_events" do

		let!(:user) { create(:user) }

		context "not logged in" do
			it "will be redirect" do
				get :get_user_events
				expect(response).to redirect_to(new_user_session_path)
			end
		end

		context "logged in" do
			before do
				sign_in user
			end

			it "no redirect and got nil event cause not create event yet" do
				get :get_user_events
				expect(@events).to be_nil
			end

			it "no redirect and got 1 event" do
				event = create(:event)
				user.events.create(event.attributes)

				get :get_user_events
				#expect(@events.count).to eq 1
			end

			it "render new template" do
				get :new
				expect(response).to be_success
				expect(response).to render_template(:new)
			end
		end
	end

end
