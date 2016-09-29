require 'rails_helper'

describe "the add a tag process", :vcr => true, :js => true do
  it "allows a user to add a tag" do
    image = FactoryGirl.create(:image)
    visit images_path
    click_on 'Login'
    fill_in 'Email', :with => 'person@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    click_on 'Ducklings'
    fill_in 'Description', :with => "kul"
    click_on 'Submit'
    expect(page).to have_content "kul"
  end
end
