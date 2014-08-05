# == Schema Information
#
# Table name: templates
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  content             :text
#  created_at          :datetime
#  updated_at          :datetime
#  is_package          :boolean
#  template_pack       :string(255)
#  asset_path          :string(255)
#  template_asset_path :string(255)
#  tex_template        :string(255)
#  template_pack_id    :integer
#

require 'spec_helper'

describe Template do
  it { should have_many :template_fields }
  it { should accept_nested_attributes_for :template_fields }

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  it { should validate_presence_of :content }
end
