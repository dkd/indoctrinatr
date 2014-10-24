# == Schema Information
#
# Table name: document_submissions
#
#  id          :integer          not null, primary key
#  template_id :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#  content     :text             default(""), not null
#

class DocumentSubmission < ActiveRecord::Base
  # associations
  belongs_to :template
  has_many :submitted_template_fields, dependent: :destroy
  has_many :template_fields, through: :submitted_template_fields

  accepts_nested_attributes_for :submitted_template_fields

  # delegations
  delegate :name, to: :template, prefix: :template
  delegate :template_asset_path, to: :template # adds method 'template_asset_path' to allow TeX templates to include assets

  # scopes
  scope :recent_first, -> { order(created_at: :desc) }

  # callbacks
  after_initialize :initialize_fields

  def retrieve_binding
    binding
  end

  def textilize textile
    RedCloth.new(textile).to_latex
  end

  # add methods for each field
  def initialize_fields
    submitted_template_fields.each do |submitted_template_field|
      instance_variable_set("@#{submitted_template_field.name}", submitted_template_field.value_or_default)

      define_singleton_method "raw_#{submitted_template_field.name}".to_sym do
        instance_variable_get("@#{submitted_template_field.name}")
      end

      define_singleton_method submitted_template_field.name.to_sym do
        instance_variable_get("@#{submitted_template_field.name}").to_latex
      end
    end
  end
end
