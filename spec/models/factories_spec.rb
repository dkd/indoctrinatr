require 'spec_helper'

FactoryGirl.factories.map(&:name).each do |factory_name|
  describe "factory #{factory_name}" do
    it 'is valid' do
      factory = FactoryGirl.build(factory_name)

      if factory.respond_to?(:valid?)
        expect(factory).to be_valid, lambda { factory.errors.full_messages.join(',') } # the lamba syntax only works with rspec 2.14 or newer;  for earlier versions, you have to call #valid? before calling the matcher, otherwise the errors will be empty
      end
    end
  end

  describe 'with trait' do
    FactoryGirl.factories[factory_name].definition.defined_traits.map(&:name).each do |trait_name|
      it "is valid with trait #{trait_name}" do
        factory = FactoryGirl.build(factory_name, trait_name)

        if factory.respond_to?(:valid?)
          expect(factory).to be_valid, lambda { factory.errors.full_messages.join(',') } # see above
        end
      end
    end
  end
end