class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :document_submission, index: true, nulL: false

      t.timestamps
    end
  end
end
