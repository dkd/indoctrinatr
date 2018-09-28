# == Schema Information
#
# Table name: document_submissions
#
#  id          :integer          not null, primary key
#  template_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  content     :text
#

class DocumentSubmission < ApplicationRecord
  # associations
  belongs_to :template
  has_many :submitted_template_fields # rubocop:disable Rails/HasManyOrHasOneDependent
  has_many :template_fields, through: :submitted_template_fields

  accepts_nested_attributes_for :submitted_template_fields

  # delegations
  delegate :name, to: :template, prefix: :template
  delegate :template_asset_path, to: :template # adds method 'template_asset_path' to allow TeX templates to include assets
  delegate :output_file_name, to: :template

  # scopes
  scope(:recent_first, -> { order(created_at: :desc) })

  def submitted_values
    SubmittedValues.new(template_asset_path, suggested_file_name, submitted_template_fields)
  end

  def suggested_file_name
    output_file_name.presence || "#{template.name}.pdf"
  end
end
