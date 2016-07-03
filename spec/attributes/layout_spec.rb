
RSpec.describe GenericHelpers::Attributes::Layout do
  let(:klass) do
    Class.new do
      include GenericHelpers::Attributes::Layout
    end
  end

  describe '.layouts' do
    it 'allows getting the available layouts for a class' do
      klass.layout(:block, 'btn-block')
      expect(klass.layouts).to eq('block' => 'btn-block')
    end
  end

  describe '.options' do
    it 'has a layout option' do
      expect(klass.options).to include(:layout)
    end
  end
end
