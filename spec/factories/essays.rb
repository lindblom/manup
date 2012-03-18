# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :essay do
    title "Titeln"
    body "Texten"
    association :category
  end
end
