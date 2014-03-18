class SubmittedTemplateField < ActiveRecord::Base
  belongs_to :document_submission
  belongs_to :template_field
end
