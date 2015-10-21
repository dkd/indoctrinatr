# == Schema Information
#
# Table name: templates
#
#  id                  :integer          not null, primary key
#  name                :string(255)      default(""), not null
#  content             :text             not null
#  created_at          :datetime
#  updated_at          :datetime
#  template_asset_path :string(255)
#  template_pack_id    :integer
#  output_file_name    :string(255)
#  textual_description :text
#

class Template < ActiveRecord::Base
  # associations
  has_many :template_fields, dependent: :destroy
  has_many :document_submissions, dependent: :destroy
  has_one :template_pack

  accepts_nested_attributes_for :template_fields, allow_destroy: true

  # validations
  validates :name, presence: true
  validates :content, presence: true

  def template_package?
    template_pack.present?
  end

  def template_asset_path
    return '' unless template_package?
    File.join(template_pack.path_to_extracted_container, 'assets')
  end

  def self.search search
    if search
      where('name LIKE ? OR textual_description LIKE ?', "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
