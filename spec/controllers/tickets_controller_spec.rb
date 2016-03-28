require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
	let!(:event) { create(:event) }
	let!(:user) { create(:user) }

	before do
		sign_in user
	end

	describe "GET #new" do
		context 'User has logged in' do
			it "responds successfully with an HTTP 200 status code" do
				get :new, event_id: event.id
				expect(response).to be_success
				expect(response).to have_http_status(200)
			end

			it 'render new template' do
				get :new, event_id: event.id
				expect(response).to render_template(:new)
			end
		end
	end

end 
