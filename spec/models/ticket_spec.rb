require 'rails_helper'

RSpec.describe Ticket, type: :model do
	context "Users cannot buy more tickets than the quantity available" do
		it "should buy 5 only" do
			ticket = build(:ticket)   
			ticket.custom_save
			expect(ticket.ticket_type.max_quantity).to eq 5 
		end
	end

end
