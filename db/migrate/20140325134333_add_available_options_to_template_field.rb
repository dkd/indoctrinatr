class AddAvailableOptionsToTemplateField < ActiveRecord::Migration[4.2]
  def change
    add_column :template_fields, :available_options, :text
  end
end
