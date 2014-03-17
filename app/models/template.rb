class Template < ActiveRecord::Base
  has_many :template_fields, dependent: :destroy
  validates_associated :template_fields
  accepts_nested_attributes_for :template_fields, allow_destroy: true

  validates :name, presence: true, uniqueness: true
  validates :content, presence: true
end
