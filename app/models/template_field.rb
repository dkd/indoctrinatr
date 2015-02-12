# == Schema Information
#
# Table name: template_fields
#
#  id                :integer          not null, primary key
#  name              :string(255)      default(""), not null
#  default_value     :text             not null
#  presentation      :string(255)      default("text"), not null
#  template_id       :integer          not null
#  created_at        :datetime
#  updated_at        :datetime
#  available_options :text
#  start_of_range    :integer
#  end_of_range      :integer
#  label             :string(255)
#

class TemplateField < ActiveRecord::Base
  # class wide constants
  VALID_PRESENTATIONS = %w(text textarea checkbox radiobutton dropdown date range file)
  REQUIRES_AVAILABLE_OPTIONS = %w(dropdown checkbox radiobutton)

  # associations
  belongs_to :template
  has_many :submitted_template_fields, dependent: :destroy
  has_many :document_submissions, through: :submitted_template_fields

  # validations
  validates :name, presence: true, uniqueness: { scope: :template_id }
  # validates :default_value, presence: true
  validates :presentation, inclusion: VALID_PRESENTATIONS
  validates :available_options, presence: true, if: :requires_available_options?
  validates :start_of_range, presence: true, if: :range?
  validates :end_of_range, presence: true, if: :range?

  # Callbacks
  before_validation :set_default_value_to_empty_string

  def set_default_value_to_empty_string
    self.default_value ||= '' # MySQL sucks!
  end

  def available_options_as_collection
    available_options.split(',').map(&:strip)
  end

  def range?
    'range' == presentation
  end

  def file?
    'file' == presentation
  end

  def requires_available_options?
    REQUIRES_AVAILABLE_OPTIONS.include? presentation
  end

  def to_form_label
    label.blank? ? name : label
  end
end
