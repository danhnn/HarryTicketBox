FactoryGirl.define do
  factory :region do
    name { "Ho Chi Minh" }
    
    trait :not_in_the_list do 
       name {"Nha Trang"}
    end
  
  end
end
