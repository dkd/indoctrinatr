class CreateTemplateFields < ActiveRecord::Migration
  def change
    create_table :template_fields do |t|
      t.string :name, default: '', null: false
      t.text :default_value, null: false
      t.string :presentation, default: 'text', null: false
      t.references :template, index: true, null: false

      t.timestamps
    end
  end
end
