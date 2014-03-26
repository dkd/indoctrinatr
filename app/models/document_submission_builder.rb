class DocumentSubmissionBuilder
  def self.build_from_template template_id
    template = Template.find template_id
    document_submission = DocumentSubmission.new template: template, content: template.content
    template.template_fields.each do |template_field|
      document_submission.submitted_template_fields.build template_field: template_field, value: template_field.default_value
    end
    document_submission
  end

  def self.build_from_params document_submission_params
    document_submission = DocumentSubmission.new document_submission_params
    document_submission.content = document_submission.try(:template).try(:content)
    document_submission
  end

  def self.build_with_defaults template_id
    build_from_template template_id
  end
end
