require 'rails_helper'

FactoryBot.factories.map(&:name).each do |factory_name|
  describe "factory #{factory_name}" do
    it 'is valid' do
      factory = FactoryBot.build(factory_name)
      expect(factory).to(be_valid, -> { factory.errors.full_messages.join(',') })
    end
  end

  describe 'with trait' do
    FactoryBot.factories[factory_name].definition.defined_traits.map(&:name).each do |trait_name|
      it "is valid with trait #{trait_name}" do
        factory = FactoryBot.build(factory_name, trait_name)
        expect(factory).to(be_valid, -> { factory.errors.full_messages.join(',') })
      end
    end
  end
end
