FactoryGirl.define do
  factory :donation do
    donation_amount 1
    name "MyString"
    phone "MyString"
    email { Faker::Internet.email }
    message "MyText"
    accepted false
  end
end
