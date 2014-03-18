class CreateDocumentSubmissions < ActiveRecord::Migration
  def change
    create_table :document_submissions do |t|
      t.references :template, index: true

      t.timestamps
    end
  end
end
