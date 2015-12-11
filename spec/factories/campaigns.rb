FactoryGirl.define do
  factory :campaign do
    funding_goal 1
    fully_funded false
    title "MyString"
    contact_person "MyString"
    contact_phone "MyString"
    contact_email { Faker::Internet.email }
    body_text "MyText"
    preamble "MyText"
  end
end
