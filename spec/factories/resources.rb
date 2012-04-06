# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :resource do
    sequence(:title) { |n| "Resurs #{n}" }
    description "En resurs"
    category "Podcast"
    url "http://www.example.com"
    factory :podcast do
      
    end
    
    factory :book do
      category "Book"
    end
  end
end
