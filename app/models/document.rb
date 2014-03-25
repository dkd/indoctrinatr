# == Schema Information
#
# Table name: documents
#
#  id                     :integer          not null, primary key
#  document_submission_id :integer
#  created_at             :datetime
#  updated_at             :datetime
#

class Document < ActiveRecord::Base
  belongs_to :document_submission

  validates :document_submission, presence: true
end
