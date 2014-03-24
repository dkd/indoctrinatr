# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :submitted_template_field do
    document_submission factory: :document_submission
    template_field factory: :template_field
    value "MyString"
  end
end
