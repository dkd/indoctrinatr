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
#  start_of_range    :integer
#  end_of_range      :integer
#

class TemplateField < ActiveRecord::Base
  # class wide constants
  VALID_PRESENTATIONS = %w(text textarea checkbox radiobutton dropdown date range)
  REQUIRES_AVAILABLE_OPTIONS = %w(dropdown checkbox radiobutton)

  # associations
  belongs_to :template
  has_many :submitted_template_fields, dependent: :destroy
  has_many :document_submissions, through: :submitted_template_fields

  # validations
  validates :name, presence: true, uniqueness: { scope: :template_id }
  validates :presentation, inclusion: VALID_PRESENTATIONS
  validates :available_options, presence: true, if: :requires_available_options?
  validates :start_of_range, presence: true, if: :range?
  validates :end_of_range, presence: true, if: :range?

  def available_options_as_collection
    available_options.split(',').map(&:strip)
  end

  def range?
    'range' == presentation
  end

  def requires_available_options?
    REQUIRES_AVAILABLE_OPTIONS.include? presentation
  end
end
