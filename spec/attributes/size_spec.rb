
RSpec.describe GenericHelpers::Attributes::Size do
  let(:klass) do
    Class.new do
      include GenericHelpers::Attributes::Size
    end
  end

  describe '.sizes' do
    it 'allows getting the available sizes for a class' do
      klass.size(:small, 'small-class')
      klass.size(:large, 'large-class')
      expect(klass.sizes).to \
        eq('small' => 'small-class', 'large' => 'large-class')
    end
  end

  describe '.options' do
    it 'has a size option' do
      expect(klass.options).to include(:size)
    end
  end
end
