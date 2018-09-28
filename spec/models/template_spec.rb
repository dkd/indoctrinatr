# == Schema Information
#
# Table name: templates
#
#  id                  :integer          not null, primary key
#  name                :string           default(""), not null
#  content             :text             not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  template_pack_id    :integer
#  output_file_name    :string
#  textual_description :text
#

require 'rails_helper'

describe Template, type: :model do
  it { is_expected.to have_many :template_fields }
  it { is_expected.to have_many :document_submissions }
  it { is_expected.to have_one :template_pack }
  it { is_expected.to accept_nested_attributes_for :template_fields }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :content }
end
