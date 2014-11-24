class AddOutputFileNameToTemplate < ActiveRecord::Migration
  def change
    add_column :templates, :output_file_name, :string
  end
end
