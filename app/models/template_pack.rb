# == Schema Information
#
# Table name: template_packs
#
#  id                         :integer          not null, primary key
#  zip_container_file_name    :string(255)
#  zip_container_content_type :string(255)
#  zip_container_file_size    :integer
#  zip_container_updated_at   :datetime
#  template_id                :integer
#  created_at                 :datetime
#  updated_at                 :datetime
#

class TemplatePack < ActiveRecord::Base
  # paperclip attachment
  has_attached_file :zip_container
  validates_attachment_presence :zip_container
  validates_attachment_file_name :zip_container, matches: [/zip\Z/]
  do_not_validate_attachment_file_type :zip_container

  # associations
  belongs_to :template, dependent: :destroy

  def path_to_config_file
    File.join(path_to_extracted_container, 'configuration.yaml')
  end

  def path_to_template_file
    File.join(path_to_extracted_container, template_pack_name << '.tex.erb')
  end

  def path_to_extracted_container
    File.join(path_for_extraction, zip_container_file_name.split('.').first)
  end

  def path_for_extraction
    File.join(*zip_container.path.split('/')[0..-3], 'extracted')
  end

  def template_pack_name
    zip_container.path.split('/').last[0..-5]
  end
end
