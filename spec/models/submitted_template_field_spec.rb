# == Schema Information
#
# Table name: submitted_template_fields
#
#  id                     :integer          not null, primary key
#  document_submission_id :integer          not null
#  template_field_id      :integer          not null
#  value                  :string(255)      default(""), not null
#  created_at             :datetime
#  updated_at             :datetime
#

require 'spec_helper'

describe SubmittedTemplateField do
  it { should belong_to :document_submission }
  it { should belong_to :template_field }
end
