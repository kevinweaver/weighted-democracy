# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "FirstName"
    last_name "LastName"
    email "email@email.com"
    password "secret"
    password_confirmation "secret"
  end
end
