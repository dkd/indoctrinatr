class AddAvailableOptionsToTemplateField < ActiveRecord::Migration
  def change
    add_column :template_fields, :available_options, :text, nil: false, default: ""
  end
end
