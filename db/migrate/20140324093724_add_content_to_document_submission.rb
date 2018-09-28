class AddContentToDocumentSubmission < ActiveRecord::Migration[4.2]
  def change
    add_column :document_submissions, :content, :text
  end
end
