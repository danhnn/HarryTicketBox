require 'rails_helper'

RSpec.describe Category, type: :model do
	let(:category) { category = Category.new }
	
	context "validation" do
		it "should check for presence of name" do
			category.save
			expect(category.errors).to_not be_empty
			expect(category.errors[:name]).to include "can't be blank"
		end
	end
end 
