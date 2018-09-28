class RemoveAnotherObsoleteColumn < ActiveRecord::Migration[4.2]
  def change
    remove_column :templates, :is_package, :boolean
  end
end
