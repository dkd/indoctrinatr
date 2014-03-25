# == Schema Information
#
# Table name: template_fields
#
#  id                :integer          not null, primary key
#  name              :string(255)      default(""), not null
#  default_value     :string(255)      default(""), not null
#  presentation      :string(255)      default("text"), not null
#  template_id       :integer          not null
#  created_at        :datetime
#  updated_at        :datetime
#  available_options :text
#

require 'spec_helper'

describe TemplateField do
  it { should belong_to :template }

  it { should validate_presence_of :name }

  it do
    pending "because of broken shoulda implementation of NOT NULL scopes"
    should validate_uniqueness_of(:name).scoped_to(:template_id)
  end

  it { should validate_presence_of :default_value }

  it { should ensure_inclusion_of(:presentation).in_array(TemplateField::VALID_PRESENTATIONS) }
end
