require 'spec_helper'

describe TemplateField do
  it { should belong_to(:template) }
  it { should validate_presence_of :template }

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of(:name).scoped_to(:template_id) }

  it { should validate_presence_of :default_value }

  it { should ensure_inclusion_of(:presentation).in_array(TemplateField::VALID_PRESENTATIONS) }
end
