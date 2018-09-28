class CreateTemplatePacks < ActiveRecord::Migration[4.2]
  def change
    create_table :template_packs do |t|
      t.attachment :zip_container
      t.references :template
      t.timestamps null: false
    end
  end
end
