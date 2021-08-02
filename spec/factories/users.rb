FactoryBot.define do
  factory :user do
    name { 'Гриша' }

    sequence(:email) { |n| "dude_#{n}@example.com" }

    after(:build) { |u| u.password_confirmation = u.password = '123456' }
  end
end
