# == Schema Information
#
# Table name: submitted_template_fields
#
#  id                       :integer          not null, primary key
#  document_submission_id   :integer          not null
#  template_field_id        :integer          not null
#  value                    :text             not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  file_upload_file_name    :string
#  file_upload_content_type :string
#  file_upload_file_size    :bigint
#  file_upload_updated_at   :datetime
#

require 'rails_helper'

describe SubmittedTemplateField, type: :model do
  it { is_expected.to belong_to :document_submission }
  it { is_expected.to belong_to :template_field }

  it { is_expected.to delegate_method(:name).to(:template_field) }
end
