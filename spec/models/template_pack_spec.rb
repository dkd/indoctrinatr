# == Schema Information
#
# Table name: template_packs
#
#  id                         :integer          not null, primary key
#  zip_container_file_name    :string
#  zip_container_content_type :string
#  zip_container_file_size    :bigint
#  zip_container_updated_at   :datetime
#  template_id                :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

require 'rails_helper'

describe TemplatePack, type: :model do
  it { is_expected.to belong_to :template }
end
