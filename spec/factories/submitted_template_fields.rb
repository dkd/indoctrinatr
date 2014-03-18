# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :submitted_template_field do
    document_submission nil
    template_field nil
    value "MyString"
  end
end
