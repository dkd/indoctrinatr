# == Schema Information
#
# Table name: template_packs
#
#  id                         :integer          not null, primary key
#  zip_container_file_name    :string(255)
#  zip_container_content_type :string(255)
#  zip_container_file_size    :integer
#  zip_container_updated_at   :datetime
#  template_id                :integer
#  created_at                 :datetime
#  updated_at                 :datetime
#

require 'spec_helper'

describe TemplatePack do
  it { should belong_to :template }
end
