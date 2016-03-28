FactoryGirl.define do
  factory :event do
    name { Faker::Name.name }
    extended_html_description { "No need to care about that thing" }
    category
    venue
    starts_at { 10.days.ago }
    ends_at { 1.day.from_now}
    published { true }
  
    trait :in_the_past do 
      ends_at { 5.day.ago }
    end
  
    trait :in_the_future do
      ends_at { 10.days.from_now }
    end
  end
end
