class CreateSubmittedTemplateFields < ActiveRecord::Migration
  def change
    create_table :submitted_template_fields do |t|
      t.references :document_submission, index: true
      t.references :template_field, index: true
      t.string :value

      t.timestamps
    end
  end
end
