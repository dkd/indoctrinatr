# == Schema Information
#
# Table name: templates
#
#  id                  :integer          not null, primary key
#  name                :string(255)      default(""), not null
#  content             :text             default(""), not null
#  created_at          :datetime
#  updated_at          :datetime
#  template_asset_path :string(255)
#  template_pack_id    :integer
#  is_package          :boolean
#

require 'spec_helper'

describe Template do
  it { should have_many :template_fields }
  it { should have_many :document_submissions }
  it { should have_one :template_pack }
  it { should accept_nested_attributes_for :template_fields }

  it { should validate_presence_of :name }
  it { should validate_presence_of :content }

  describe 'differentiating templates made via web interface and uploaded template packd' do
    it "knows when it's a (normal) template" do
      expect(Template.new.template_type).to eq 'Template'
    end

    it "knows when it's a template pack" do
      expect(Template.new(template_pack: TemplatePack.new).template_type).to eq 'Template Pack'
    end
  end
end
