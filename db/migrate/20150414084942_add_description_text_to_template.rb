class AddDescriptionTextToTemplate < ActiveRecord::Migration[4.2]
  def change
    add_column :templates, :textual_description, :text
  end
end
