FactoryGirl.define do
  factory :ticket_type do
    name { Faker::Name.name  }
    price { Faker::Number.number(3) }
    max_quantity { 20 }

    trait :price_one do 
      price { 1 }
    end
  
  end
end
