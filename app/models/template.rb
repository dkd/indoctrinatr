# == Schema Information
#
# Table name: templates
#
#  id                  :integer          not null, primary key
#  name                :string(255)      default(""), not null
#  content             :text             default(""), not null
#  created_at          :datetime
#  updated_at          :datetime
#  asset_path          :string(255)
#  template_asset_path :string(255)
#  tex_template        :string(255)
#  template_pack_id    :integer
#  is_package          :boolean
#

class Template < ActiveRecord::Base
  has_many :template_fields, dependent: :destroy
  has_many :document_submissions, dependent: :destroy
  has_one :template_pack

  accepts_nested_attributes_for :template_fields, allow_destroy: true

  validates :name, presence: true # TODO: scope to creator_id
  validates :content, presence: true

  def template_type
    is_package? ? 'Template Pack' : 'GUI Template'
  end
end
