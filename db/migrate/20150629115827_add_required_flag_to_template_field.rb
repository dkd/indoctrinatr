class AddRequiredFlagToTemplateField < ActiveRecord::Migration
  def change
    add_column :template_fields, :required, :boolean, default: false
  end
end
