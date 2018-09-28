class CreateTemplateFields < ActiveRecord::Migration[4.2]
  def change
    create_table :template_fields do |t|
      t.string :name, default: '', null: false
      t.text :default_value, null: false
      t.string :presentation, default: 'text', null: false
      t.references :template, index: true, null: false

      t.timestamps null: false
    end
  end
end
