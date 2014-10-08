class RemoveAnotherObsoleteColumn < ActiveRecord::Migration
  def change
    remove_column :templates, :is_package
  end
end
