FactoryGirl.define do
  factory :user do
    email('person@gmail.com')
    password('password')
  end
end
