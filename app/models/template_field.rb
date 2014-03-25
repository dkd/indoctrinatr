# == Schema Information
#
# Table name: template_fields
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  default_value :string(255)
#  presentation  :string(255)
#  template_id   :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class TemplateField < ActiveRecord::Base
  VALID_PRESENTATIONS = %w[text textarea checkbox radio-button]

  belongs_to :template
  has_many :submitted_template_fields
  has_many :document_submissions, through: :submitted_template_fields

  validates :name, presence: true, uniqueness: { scope: :template_id }
  validates :default_value, presence: true
  validates :presentation, inclusion: VALID_PRESENTATIONS
end
