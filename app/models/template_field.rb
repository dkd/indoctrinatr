# == Schema Information
#
# Table name: template_fields
#
#  id                :integer          not null, primary key
#  name              :string(255)      default(""), not null
#  default_value     :string(255)      default(""), not null
#  presentation      :string(255)      default("text"), not null
#  template_id       :integer          not null
#  created_at        :datetime
#  updated_at        :datetime
#  available_options :text
#

class TemplateField < ActiveRecord::Base
  VALID_PRESENTATIONS = %w[text textarea checkbox radiobutton dropdown]

  belongs_to :template
  has_many :submitted_template_fields
  has_many :document_submissions, through: :submitted_template_fields

  validates :name, presence: true, uniqueness: { scope: :template_id }
  validates :default_value, presence: true
  validates :presentation, inclusion: VALID_PRESENTATIONS

  def available_options_as_collection
    available_options.split(",").map(&:strip)
  end
end
