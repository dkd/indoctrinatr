class CreateTemplateFields < ActiveRecord::Migration
  def change
    create_table :template_fields do |t|
      t.string :name
      t.string :default_value
      t.string :presentation
      t.references :template, index: true

      t.timestamps
    end
  end
end
