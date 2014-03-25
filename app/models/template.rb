# == Schema Information
#
# Table name: templates
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  content    :text             default(""), not null
#  created_at :datetime
#  updated_at :datetime
#

class Template < ActiveRecord::Base
  has_many :template_fields, dependent: :destroy
  has_many :document_submissions, dependent: :destroy

  accepts_nested_attributes_for :template_fields, allow_destroy: true

  validates :name, presence: true, uniqueness: true # TODO: scope to creator_id
  validates :content, presence: true
end
