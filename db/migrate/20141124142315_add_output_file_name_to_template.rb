class AddOutputFileNameToTemplate < ActiveRecord::Migration[4.2]
  def change
    add_column :templates, :output_file_name, :string
  end
end
