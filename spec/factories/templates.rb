# == Schema Information
#
# Table name: templates
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  content    :text             default(""), not null
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :template do
    sequence :name do |n|
      "Name #{n}"
    end 
    content "MyText"
  end
end
    
