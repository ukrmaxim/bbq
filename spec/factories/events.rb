FactoryBot.define do
  factory :event do
    association :user
    title { 'Футбик' }
    address { 'Харьков' }
    datetime { Time.current }
  end
end
