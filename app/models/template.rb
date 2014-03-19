class Template < ActiveRecord::Base
  has_many :template_fields, dependent: :destroy
  has_many :document_submissions, dependent: :destroy

  accepts_nested_attributes_for :template_fields, allow_destroy: true

  validates :name, presence: true, uniqueness: true # TODO: scope to creator_id
  validates :content, presence: true
end
