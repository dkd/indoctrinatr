class AddLabelToTemplateField < ActiveRecord::Migration[4.2]
  def change
    add_column :template_fields, :label, :string
  end
end
