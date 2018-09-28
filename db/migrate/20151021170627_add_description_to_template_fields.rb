class AddDescriptionToTemplateFields < ActiveRecord::Migration[4.2]
  def change
    add_column :template_fields, :description, :text
  end
end
