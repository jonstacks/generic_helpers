
# frozen_string_literal: true

RSpec.describe GenericHelpers::Attributes::Context do
  let(:klass) do
    Class.new do
      include GenericHelpers::Attributes::Context
    end
  end

  describe '.contexts' do
    it 'allows getting the available contexts for a class' do
      klass.context('btn-default')
      klass.context(:primary, 'btn-primary')
      klass.context(:success, 'btn-success')
      klass.context(:info,    'btn-info')
      expect(klass.contexts).to eq(
        'primary' => 'btn-primary',
        'success' => 'btn-success',
        'info'    => 'btn-info'
      )
    end

    it 'sets the default size based on the DSL' do
      klass.context('btn-default')
      klass.context(:primary, 'btn-primary')
      klass.context(:success, 'btn-success')
      expect(klass.contexts.default).to eq('btn-default')
    end
  end

  describe '.options' do
    it 'has a context option' do
      expect(klass.options).to include(:context)
    end
  end
end
