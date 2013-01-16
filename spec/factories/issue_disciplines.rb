# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :issue_discipline, :class => 'IssueDisciplines' do
    issue_id 1
    discipline_id 1
  end
end
