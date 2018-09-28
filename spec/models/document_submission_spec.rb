# == Schema Information
#
# Table name: document_submissions
#
#  id          :integer          not null, primary key
#  template_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  content     :text
#

require 'rails_helper'

describe DocumentSubmission, type: :model do
  it { is_expected.to belong_to :template }

  it { is_expected.to have_many :submitted_template_fields }
  it { is_expected.to have_many(:template_fields).through(:submitted_template_fields) }

  it { is_expected.to accept_nested_attributes_for :submitted_template_fields }

  it { is_expected.to delegate_method(:template_name).to(:template).as(:name) }
  it { is_expected.to delegate_method(:template_asset_path).to(:template) }
end
