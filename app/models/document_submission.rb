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

  def retrieve_binding
    binding
  end

  def create_document
    Document.create document_submission: self
  end
end
