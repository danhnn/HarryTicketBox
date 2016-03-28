FactoryGirl.define do
  factory :ticket do
    user
    ticket_type
    quantity 15
  end
end
