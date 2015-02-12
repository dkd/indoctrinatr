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

require 'spec_helper'

describe TemplateField do
  let(:valid_presentations) { TemplateField::VALID_PRESENTATIONS }

  it { should belong_to :template }
  it { should have_many :submitted_template_fields }
  it { should have_many(:document_submissions).through(:submitted_template_fields) }

  it { should validate_presence_of :name }
  it { should validate_inclusion_of(:presentation).in_array(valid_presentations) }

  describe 'valid presentations' do
    specify '5 presentations' do
      expect(valid_presentations.size).to eql 8
    end

    it 'includes text, textarea, checkbox, radiobutton, dropdown, date and range' do
      %w(text textarea checkbox radiobutton dropdown date range file).each do |expected_presentation|
        expect(valid_presentations).to include expected_presentation
      end
    end
  end

  describe 'requires presence of available_options' do
    specify 'in case of a dropdown field' do
      expect(TemplateField.new(presentation: 'dropdown')).to validate_presence_of :available_options
    end

    specify 'in case of a checkbox field' do
      expect(TemplateField.new(presentation: 'checkbox')).to validate_presence_of :available_options
    end

    specify 'in case of a radiobutton field' do
      expect(TemplateField.new(presentation: 'radiobutton')).to validate_presence_of :available_options
    end
  end

  it 'splits available options at comma and strips with spaces' do
    tf = TemplateField.new available_options: ' aa,   bb  , cc '

    expect(tf.available_options_as_collection.size).to eql 3
    %w(aa bb cc).each do |expected_option|
      expect(tf.available_options_as_collection).to include expected_option
    end
  end
end
