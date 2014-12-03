class AddAttributesToTemplates < ActiveRecord::Migration
  def change
    add_column :templates, :asset_path, :string
    add_column :templates, :template_asset_path, :string
    add_column :templates, :tex_template, :string
    add_reference :templates, :template_pack, index: true, null: true
    add_column :templates, :is_package, :boolean
  end
end
