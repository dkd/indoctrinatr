class RemoveObsoleteColumns < ActiveRecord::Migration
  def change
    remove_column :templates, :asset_path, :string
    remove_column :templates, :tex_template, :string
  end
end
