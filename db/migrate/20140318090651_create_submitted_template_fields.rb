class CreateSubmittedTemplateFields < ActiveRecord::Migration[4.2]
  def change
    create_table :submitted_template_fields do |t|
      t.references :document_submission, index: true, null: false
      t.references :template_field, index: true, null: false
      t.text :value, null: false

      t.timestamps null: false
    end
  end
end
