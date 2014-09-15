class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name, default: '', null: false
      t.text :content, default: '', null: false

      t.timestamps
    end
  end
end
