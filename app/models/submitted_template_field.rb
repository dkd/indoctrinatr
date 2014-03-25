class SubmittedTemplateField < ActiveRecord::Base
  belongs_to :document_submission
  belongs_to :template_field

  def to_form_label
    template_field.name
  end
end
