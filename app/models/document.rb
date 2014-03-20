class Document < ActiveRecord::Base
  belongs_to :document_submission

  validates :document_submission, presence: true
end
