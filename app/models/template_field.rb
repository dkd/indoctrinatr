class TemplateField < ActiveRecord::Base
  VALID_PRESENTATIONS = %w[text textarea]
  belongs_to :template

  validates :name, presence: true, uniqueness: { scope: :template_id }
  validates :default_value, presence: true
  validates :presentation, inclusion: VALID_PRESENTATIONS
  validates :template, presence: true
end
