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
  belongs_to :template

  has_many :submitted_template_fields, dependent: :destroy
  has_many :template_fields, through: :submitted_template_fields

  accepts_nested_attributes_for :submitted_template_fields

  delegate :name, to: :template, prefix: :template

  after_initialize :initialize_fields

  def retrieve_binding
    binding
  end

  def textilize textile
    RedCloth.new(textile).to_latex
  end

  # add method 'template_asset_path' to allow templates to include assets
  def template_asset_path
    template.template_asset_path
  end

  # add methods for each field
  def initialize_fields
    submitted_template_fields.each do |submitted_template_field|
      define_singleton_method submitted_template_field.name.to_sym do
        instance_variable_get("@#{submitted_template_field.name}").to_s.to_latex
      end
      instance_variable_set("@#{submitted_template_field.name}", submitted_template_field.value_or_default)
    end
  end
end
