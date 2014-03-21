class TemplateField < ActiveRecord::Base
  VALID_PRESENTATIONS = %w[text textarea checkbox radio-button]

  belongs_to :template
  has_many :submitted_template_fields
  has_many :document_submissions, through: :submitted_template_fields

  validates :name, presence: true, uniqueness: { scope: :template_id }
  validates :default_value, presence: true
  validates :presentation, inclusion: VALID_PRESENTATIONS
end
