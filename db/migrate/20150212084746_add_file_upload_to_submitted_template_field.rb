class AddFileUploadToSubmittedTemplateField < ActiveRecord::Migration[4.2]
  def change
    add_attachment :submitted_template_fields, :file_upload
  end
end
