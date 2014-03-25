# == Schema Information
#
# Table name: templates
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Template do
  it { should have_many :template_fields }
  it { should accept_nested_attributes_for :template_fields }

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  it { should validate_presence_of :content }
end
