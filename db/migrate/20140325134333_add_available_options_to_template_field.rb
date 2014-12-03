class AddAvailableOptionsToTemplateField < ActiveRecord::Migration
  def change
    add_column :template_fields, :available_options, :text
  end
end
