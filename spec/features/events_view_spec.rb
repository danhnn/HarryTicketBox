require 'rails_helper'



RSpec.describe "event page", :type => :feature  do
    let(:user) {user = create(:user)}

    it "displays successful login text" do
        user = User.create!(:name => "jdoe", :password => "12345678",:email => "jdoe@gmail.com")

        visit "/users/sign_in"
        fill_in "Email", :with => "jdoe@gmail.com"
        fill_in "Password", :with => "12345678"
        click_button "Log in"

        expect(page).to have_text("Signed in successfully")
    end
end

