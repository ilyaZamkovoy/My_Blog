FactoryGirl.define do
  factory :post do
    title "My New Title"
    text "My New Text"
    user
  end
end
