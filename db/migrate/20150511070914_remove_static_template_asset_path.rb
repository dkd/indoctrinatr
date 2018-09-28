class RemoveStaticTemplateAssetPath < ActiveRecord::Migration[4.2]
  def change
    remove_column :templates, :template_asset_path, type: :string
  end
end
