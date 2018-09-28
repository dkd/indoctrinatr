# == Schema Information
#
# Table name: template_fields
#
#  id                :integer          not null, primary key
#  name              :string           default(""), not null
#  default_value     :text             not null
#  presentation      :string           default("text"), not null
#  template_id       :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  available_options :text
#  start_of_range    :integer
#  end_of_range      :integer
#  label             :string
#  required          :boolean          default(FALSE)
#  description       :text
#

# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :template_field do
    name { 'MyString' }
    default_value { 'MyString' }
    presentation { 'text' }

    template factory: :template
  end
end
