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
  # associations
  belongs_to :document_submission
  belongs_to :template_field

  # delegations
  delegate :name, to: :template_field
  delegate :to_form_label, to: :template_field

  # Callbacks
  after_initialize :set_value_to_empty_string

  def set_value_to_empty_string
    return value if value.present?
    self.value = ''
  end

  def value_or_default
    return value if value.present?
    template_field.default_value
  end
end
