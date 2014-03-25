# == Schema Information
#
# Table name: document_submissions
#
#  id          :integer          not null, primary key
#  template_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  content     :text             default(""), not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :document_submission do
    template factory: :template
  end
end
