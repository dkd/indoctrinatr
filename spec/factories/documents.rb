# == Schema Information
#
# Table name: documents
#
#  id                     :integer          not null, primary key
#  document_submission_id :integer
#  created_at             :datetime
#  updated_at             :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :document do
    document_submission factory: :document_submission
  end
end
