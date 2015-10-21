class AddDescriptionToTemplateFields < ActiveRecord::Migration
  def change
    add_column :template_fields, :description, :text
  end
end
