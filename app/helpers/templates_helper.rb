module TemplatesHelper
  def link_to_form_or_document template
    link_to "Fill in form", new_document_submission_url(template_id: template), class: "button tiny success"
  end
end
