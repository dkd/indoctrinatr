class CreateTemplatePacks < ActiveRecord::Migration
  def change
    create_table :template_packs do |t|
      t.attachment :zip_container
      t.references :template
      t.timestamps null: false
    end
  end
end
