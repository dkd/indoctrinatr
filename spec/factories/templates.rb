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

# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :template do
    sequence :name do |n|
      "Name #{n}"
    end
    content { 'MyText' }
  end
end
