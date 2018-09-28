# == Schema Information
#
# Table name: document_submissions
#
#  id          :integer          not null, primary key
#  template_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  content     :text
#

# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :document_submission do
    template factory: :template
  end
end
