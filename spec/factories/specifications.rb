# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :specification do
    name "MyString"
    radix 1
    variables 1
    content "MyText"
    complete "MyText"
  end
end
