class AddRequiredFlagToTemplateField < ActiveRecord::Migration[4.2]
  def change
    add_column :template_fields, :required, :boolean, default: false
  end
end
