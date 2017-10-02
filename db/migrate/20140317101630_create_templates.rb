class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name, default: '', null: false
      t.text :content, null: false

      t.timestamps null: false
    end
  end
end
