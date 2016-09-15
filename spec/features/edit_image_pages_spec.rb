require 'rails_helper'

describe "the edit an image process" do
  before(:each) do
    image = FactoryGirl.create(:image)
    visit images_path
    click_link 'Login'
    fill_in 'Email', :with => 'person@gmail.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    click_on 'Person'
  end

  it "allows a user to edit an image" do
    click_link 'Edit image'
    fill_in 'Title', :with => 'Ducks'
    click_on 'Update Image'
    expect(page).to have_content 'Your image has been edited!'
  end

  it "allows a user to delete an image" do
    click_link 'Delete image'
    expect(page).to have_content 'Your image has been deleted!'
  end

  it "won't edit an image if there's no title" do
    click_link 'Edit image'
    fill_in 'Title', :with => ''
    click_on 'Update Image'
    expect(page).to have_content 'Whoops, your image was not edited!'
  end
end
