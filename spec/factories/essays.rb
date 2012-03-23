# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :essay do
    sequence :body do |n|
      "# title#{n}\nthe ingress#{n}\n\nsome more text."
    end
    published true
  end
end
