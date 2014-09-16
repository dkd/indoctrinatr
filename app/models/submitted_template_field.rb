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

class SubmittedTemplateField < ActiveRecord::Base
  belongs_to :document_submission
  belongs_to :template_field

  def value_or_default
    value || template_field.default_value
  end

  def name
    template_field.name
  end

  def to_form_label
    template_field.name
  end
end
