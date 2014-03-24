# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :document do
    document_submission factory: :document_submission
  end
end
