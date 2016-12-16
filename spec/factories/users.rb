FactoryGirl.define do
  factory :user do
    email
    full_name { Faker::Name.name }
    auth_token "585404c6d9f6c4680a6108e719b57c00"
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
