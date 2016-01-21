FactoryGirl.define do
  factory :donation do
    donation_amount 1
    name "MyString"
    phone "MyString"
    email { Faker::Internet.email }
    message "MyText"
    accepted false

    trait :accepted do
      accepted true
    end
  end
end
