require 'rails_helper'

describe Image do
  it { should belong_to :user }
  it { should validate_presence_of :title }
  it { should validate_presence_of :address }

  it "creates latitude and longitude values from the address entered by a user", :vcr => true do
    image = FactoryGirl.create(:image)
    expect(image.latitude).to(eq(45.5230622))
  end
  #
  # it "adds an error if no map is shown", :vcr true do
  #   image = FactoryGirl.create(:image)
  #   image.errors.images.should eq [""]

end
