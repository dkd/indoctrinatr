# == Schema Information
#
# Table name: submitted_template_fields
#
#  id                       :integer          not null, primary key
#  document_submission_id   :integer          not null
#  template_field_id        :integer          not null
#  value                    :text             not null
#  created_at               :datetime
#  updated_at               :datetime
#  file_upload_file_name    :string
#  file_upload_content_type :string
#  file_upload_file_size    :integer
#  file_upload_updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :submitted_template_field do
    document_submission factory: :document_submission
    template_field factory: :template_field
    value 'MyString'
  end
end
