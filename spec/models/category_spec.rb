require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validation" do
  	it "should check for presence of name" do
  		category = Category.new
  		expect(category.save).to equal false
  	end
end
