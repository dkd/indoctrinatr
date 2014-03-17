# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :template_field do
    name "MyString"
    default_value "MyString"
    presentation "text"

    template factory: :template
  end
end
