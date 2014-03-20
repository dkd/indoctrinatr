require 'spec_helper'

describe SubmittedTemplateField do
  it { should belong_to :document_submission }
  it { should belong_to :template_field }
end
