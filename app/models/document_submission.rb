# == Schema Information
#
# Table name: document_submissions
#
#  id          :integer          not null, primary key
#  template_id :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#  content     :text             default(""), not null
#

class DocumentSubmission < ActiveRecord::Base
  belongs_to :template

  has_many :submitted_template_fields, dependent: :destroy
  has_many :template_fields, through: :submitted_template_fields
  has_one :document

  accepts_nested_attributes_for :submitted_template_fields

  delegate :name, to: :template, prefix: :template

  after_commit :create_document, on: :create
  after_initialize :initialize_fields

  def retrieve_binding
    binding
  end

  def create_document
    Document.create document_submission: self
  end

  def initialize_fields
    submitted_template_fields.each do |submitted_template_field|
      (class << self; self; end).send(:define_method, submitted_template_field.name.to_sym, -> { instance_variable_get("@#{submitted_template_field.name}").to_s.to_latex })
      instance_variable_set("@#{submitted_template_field.name}", submitted_template_field.value_or_default)
    end
  end
end
