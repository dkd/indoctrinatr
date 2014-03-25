# == Schema Information
#
# Table name: template_fields
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  default_value :string(255)
#  presentation  :string(255)
#  template_id   :integer
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :template_field do
    name "MyString"
    default_value "MyString"
    presentation "text"

    template factory: :template
  end
end
