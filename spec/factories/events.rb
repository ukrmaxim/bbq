FactoryBot.define do
  factory :event do
    association :user
    title { 'Football' }
    address { 'Kharkiv' }
    datetime { Time.current }
  end
end
