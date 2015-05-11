class RemoveStaticTemplateAssetPath < ActiveRecord::Migration
  def change
    remove_column :templates, :template_asset_path, type: :string
  end
end
