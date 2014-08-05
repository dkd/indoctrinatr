class AddRangeFieldtoTemplateFields < ActiveRecord::Migration
  def change
    add_column :template_fields, :start_of_range, :integer
    add_column :template_fields, :end_of_range, :integer
  end
end
