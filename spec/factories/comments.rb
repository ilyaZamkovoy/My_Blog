FactoryGirl.define do
  factory :comment do
    text "My New Comment Text"
    post
    user
  end
end
