FactoryGirl.define do
  factory :donation do
    donation_amount 1
    name "MyString"
    company "MyString"
    phone "MyString"
    email { Faker::Internet.email }
    message "MyText"
  end
end
