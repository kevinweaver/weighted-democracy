# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    name "MyString"
    text "MyText"
    discipline_id 1
  end
end
