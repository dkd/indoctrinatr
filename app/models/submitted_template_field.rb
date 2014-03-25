# == Schema Information
#
# Table name: submitted_template_fields
#
#  id                     :integer          not null, primary key
#  document_submission_id :integer
#  template_field_id      :integer
#  value                  :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

class SubmittedTemplateField < ActiveRecord::Base
  belongs_to :document_submission
  belongs_to :template_field

  def to_form_label
    template_field.name
  end
end
