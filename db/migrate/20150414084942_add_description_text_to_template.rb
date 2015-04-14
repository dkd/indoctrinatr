class AddDescriptionTextToTemplate < ActiveRecord::Migration
  def change
    add_column :templates, :textual_description, :text
  end
end
