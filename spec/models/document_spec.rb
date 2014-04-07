# == Schema Information
#
# Table name: documents
#
#  id                     :integer          not null, primary key
#  document_submission_id :integer
#  created_at             :datetime
#  updated_at             :datetime
#

require 'spec_helper'

describe Document do
  it { should belong_to :document_submission }
  it { should validate_presence_of :document_submission }
end
