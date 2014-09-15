class AddContentToDocumentSubmission < ActiveRecord::Migration
  def change
    add_column :document_submissions, :content, :text, default: '', null: false
  end
end
