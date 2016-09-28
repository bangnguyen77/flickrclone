FactoryGirl.define do
  factory(:image) do
    title("Ducklings")
    address("Portland, OR")
    user
    image Rack::Test::UploadedFile.new('spec/fixtures/images/ducklings.jpg', 'image/jpg')
  end
end
