FactoryGirl.define do
  factory :user do
    email
    full_name { Faker::Name.name }
    auth_token "2dc09cc4fcfc20bf68432e333fc47500"
    password "123456"
    password_confirmation { password }
    confirmed_at 1.hour.ago
  end

  trait :not_confirmed do
    confirmed_at nil

    after(:create) do |user|
      user.update(confirmation_sent_at: 3.days.ago)
    end
  end
end
