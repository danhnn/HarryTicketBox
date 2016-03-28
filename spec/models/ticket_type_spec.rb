require 'rails_helper'

RSpec.describe TicketType, type: :model do
  context "multiple ticket with different price" do
  	it "handle one ticket type case" do

  	end

  	it "handle duplicates" do		
      type1 = create(:ticket_type,:price_one)
      type2 = create(:ticket_type,:price_one)

  		expect(type2.errors[:base]).to include "Cannot have duplicates"  
  	end

  end

  context "validation" do
    it "should show maxmaximum 10 tickets for user to buy" do
      ticket_type = create(:ticket_type)
      expect(ticket_type.quantity_show_in_combobox).to eq 10
    end
  end
end
