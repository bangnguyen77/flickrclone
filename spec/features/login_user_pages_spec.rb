require 'rails_helper'

describe "the user login process" do
  before(:each) do
    user = FactoryGirl.create(:user)
    visit images_path
  end

  it "logs in a user" do
    click_link 'Login'
    fill_in 'Email', :with => 'person@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    expect(page).to have_content 'Person'
  end

  it "allows a user to see their profile page" do
    click_link 'Login'
    fill_in 'Email', :with => 'person@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    click_on 'Person'
    expect(page).to have_content "Person's profile"
  end
end
