class CreateTemplatePacks < ActiveRecord::Migration
  def change
    create_table :template_packs do |t|
      t.attachment :zip_container
      t.belongs_to :template
      t.timestamps
    end
  end
end
