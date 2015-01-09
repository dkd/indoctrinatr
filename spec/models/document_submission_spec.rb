# == Schema Information
#
# Table name: document_submissions
#
#  id          :integer          not null, primary key
#  template_id :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#  content     :text
#

require 'spec_helper'

describe DocumentSubmission do
  it { should belong_to :template }

  it { should have_many :submitted_template_fields }
  it { should have_many(:template_fields).through(:submitted_template_fields) }

  it { should accept_nested_attributes_for :submitted_template_fields }

  it { should delegate_method(:template_name).to(:template).as(:name) }
  it { should delegate_method(:template_asset_path).to(:template) }
end
