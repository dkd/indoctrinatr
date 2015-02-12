class AddFileUploadToSubmittedTemplateField < ActiveRecord::Migration
  def change
    add_attachment :submitted_template_fields, :file_upload
  end
end
