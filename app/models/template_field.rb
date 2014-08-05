# == Schema Information
#
# Table name: template_fields
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  default_value     :string(255)
#  presentation      :string(255)
#  template_id       :integer
#  created_at        :datetime
#  updated_at        :datetime
#  available_options :text             default("")
#  start_of_range    :integer
#  end_of_range      :integer
#

class TemplateField < ActiveRecord::Base
  VALID_PRESENTATIONS = %w[text textarea checkbox radiobutton dropdown date range]

  belongs_to :template
  has_many :submitted_template_fields
  has_many :document_submissions, through: :submitted_template_fields

  validates :name, presence: true, uniqueness: { scope: :template_id }
  validates :default_value, presence: true
  validates :presentation, inclusion: VALID_PRESENTATIONS
  validates :available_options, presence: true, if: :is_option?
  validates :start_of_range, presence: true, if: :is_range?
  validates :end_of_range, presence: true, if: :is_range?

  def available_options_as_collection
    available_options.split(",").map(&:strip)
  end

  def is_range?
    presentation == "range"
  end

  def is_option?
    presentation == "dropdown" || presentation == "checkbox" || presentation == "radiobutton" || presentation == "date"
  end
end