require 'spec_helper'

describe DocumentSubmission do
  it { should have_many(:submitted_template_fields) }
  it { should have_many(:template_fields).through(:submitted_template_fields) }

  it { should accept_nested_attributes_for(:submitted_template_fields) }

  it { should respond_to(:template_name) }
end
