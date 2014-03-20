class DocumentSubmission < ActiveRecord::Base
  belongs_to :template

  has_many :submitted_template_fields, dependent: :destroy
  has_many :template_fields, through: :submitted_template_fields
  has_many :documents

  accepts_nested_attributes_for :submitted_template_fields

  delegate :name, to: :template, prefix: :template

  def get_binding
    binding
  end
end
