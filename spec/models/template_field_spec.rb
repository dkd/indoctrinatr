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

require 'rails_helper'

describe TemplateField, type: :model do
  let(:valid_presentations) { TemplateField::VALID_PRESENTATIONS }

  it { is_expected.to belong_to :template }
  it { is_expected.to have_many :submitted_template_fields }
  it { is_expected.to have_many(:document_submissions).through(:submitted_template_fields) }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_inclusion_of(:presentation).in_array(valid_presentations) }

  describe 'valid presentations' do
    specify '5 presentations' do
      expect(valid_presentations.size).to be 8
    end

    it 'includes text, textarea, checkbox, radiobutton, dropdown, date and range' do
      %w[text textarea checkbox radiobutton dropdown date range file].each do |expected_presentation|
        expect(valid_presentations).to include expected_presentation
      end
    end
  end

  describe 'requires presence of available_options' do
    specify 'in case of a dropdown field' do
      expect(described_class.new(presentation: 'dropdown')).to validate_presence_of :available_options
    end

    specify 'in case of a checkbox field' do
      expect(described_class.new(presentation: 'checkbox')).to validate_presence_of :available_options
    end

    specify 'in case of a radiobutton field' do
      expect(described_class.new(presentation: 'radiobutton')).to validate_presence_of :available_options
    end
  end

  it 'splits available options at comma and strips with spaces' do # rubocop:disable RSpec/MultipleExpectations
    tf = described_class.new available_options: ' aa,   bb  , cc '

    expect(tf.available_options_as_collection.size).to be 3
    %w[aa bb cc].each do |expected_option|
      expect(tf.available_options_as_collection).to include expected_option
    end
  end
end
