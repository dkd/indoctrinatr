# == Schema Information
#
# Table name: template_fields
#
#  id                :integer          not null, primary key
#  name              :string(255)      default(""), not null
#  default_value     :text             not null
#  presentation      :string(255)      default("text"), not null
#  template_id       :integer          not null
#  created_at        :datetime
#  updated_at        :datetime
#  available_options :text
#  start_of_range    :integer
#  end_of_range      :integer
#  label             :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :template_field do
    name 'MyString'
    default_value 'MyString'
    presentation 'text'

    template factory: :template
  end
end
