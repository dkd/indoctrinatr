class RemoveObsoleteColumns < ActiveRecord::Migration
  def change
    remove_column :templates, :asset_path
    remove_column :templates, :tex_template
  end
end
