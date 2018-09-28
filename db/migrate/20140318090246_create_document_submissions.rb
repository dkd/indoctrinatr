class CreateDocumentSubmissions < ActiveRecord::Migration[4.2]
  def change
    create_table :document_submissions do |t|
      t.references :template, index: true, null: false

      t.timestamps null: false
    end
  end
end
