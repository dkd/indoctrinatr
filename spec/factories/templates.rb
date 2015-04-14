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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :template do
    sequence :name do |n|
      "Name #{n}"
    end
    content 'MyText'
  end
end
