# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :document_submission do
    template factory: :template
  end
end
