# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :borrowing do
    user nil
    book nil
    due_back "2015-09-03"
  end
end
