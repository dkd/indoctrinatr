# == Schema Information
#
# Table name: templates
#
#  id                  :integer          not null, primary key
#  name                :string(255)      default(""), not null
#  content             :text             not null
#  created_at          :datetime
#  updated_at          :datetime
#  template_asset_path :string(255)
#  template_pack_id    :integer
#  output_file_name    :string(255)
#  textual_description :text
#

require 'spec_helper'

describe Template do
  it { should have_many :template_fields }
  it { should have_many :document_submissions }
  it { should have_one :template_pack }
  it { should accept_nested_attributes_for :template_fields }

  it { should validate_presence_of :name }
  it { should validate_presence_of :content }
end
