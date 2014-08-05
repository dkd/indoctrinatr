# == Schema Information
#
# Table name: template_fields
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  default_value     :string(255)
#  presentation      :string(255)
#  template_id       :integer
#  created_at        :datetime
#  updated_at        :datetime
#  available_options :text             default("")
#  start_of_range    :integer
#  end_of_range      :integer
#

require 'spec_helper'

describe TemplateField do
  let(:valid_presentations) { TemplateField::VALID_PRESENTATIONS }

  describe "valid presentations" do
    specify "5 presentations" do
      expect(valid_presentations.size).to eql 5
    end

    it "includes text, textarea, checkbox, radiobutton dropdown" do
      ["text", "textarea", "checkbox", "radiobutton", "dropdown"].each do |expected_presentation|
        expect(valid_presentations).to include expected_presentation
      end
    end
  end

  it { should belong_to :template }
  it { should have_many :submitted_template_fields }
  it { should have_many(:document_submissions).through(:submitted_template_fields) }

  it { should validate_presence_of :name }

  it do
    should validate_uniqueness_of(:name).scoped_to(:template_id)
  end

  it { should validate_presence_of :default_value }

  it { should ensure_inclusion_of(:presentation).in_array(valid_presentations) }

  it "splits available options at comma and strips with spaces" do
    tf = TemplateField.new available_options: " aa,   bb  , cc "

    expect(tf.available_options_as_collection.size).to eql 3
    ["aa", "bb", "cc"].each do |expected_option|
      expect(tf.available_options_as_collection).to include expected_option
    end
  end
end
