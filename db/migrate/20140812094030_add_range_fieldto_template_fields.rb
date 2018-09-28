class AddRangeFieldtoTemplateFields < ActiveRecord::Migration[4.2]
  def change
    add_column :template_fields, :start_of_range, :integer
    add_column :template_fields, :end_of_range, :integer
  end
end
