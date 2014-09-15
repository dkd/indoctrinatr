# == Schema Information
#
# Table name: templates
#
#  id                  :integer          not null, primary key
#  name                :string(255)      default(""), not null
#  content             :text             default(""), not null
#  created_at          :datetime
#  updated_at          :datetime
#  asset_path          :string(255)
#  template_asset_path :string(255)
#  tex_template        :string(255)
#  template_pack_id    :integer
#  is_package          :boolean
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
