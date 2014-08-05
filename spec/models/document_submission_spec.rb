# == Schema Information
#
# Table name: document_submissions
#
#  id                       :integer          not null, primary key
#  template_id              :integer
#  created_at               :datetime
#  updated_at               :datetime
#  content                  :text             default(""), not null
#  document_submission_name :string(255)
#  user_id                  :integer
#

require 'spec_helper'

describe DocumentSubmission do
  it { should belong_to :template }

  it { should have_many :submitted_template_fields }
  it { should have_many(:template_fields).through(:submitted_template_fields) }
  it { should have_one :document }

  it { should accept_nested_attributes_for :submitted_template_fields }

  it { should respond_to :template_name }
end
