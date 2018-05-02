
# frozen_string_literal: true

RSpec.describe GenericHelpers::Attributes::Align do
  let(:klass) do
    Class.new do
      include GenericHelpers::Attributes::Align
    end
  end

  describe '.aligns' do
    it 'allows getting the available aligns for a class' do
      klass.align(:left,  'dropdown-menu-left')
      klass.align(:right, 'dropdown-menu-right')
      expect(klass.aligns).to \
        eq('left' => 'dropdown-menu-left', 'right' => 'dropdown-menu-right')
    end
  end

  describe '.options' do
    it 'has an align option' do
      expect(klass.options).to include(:align)
    end
  end
end
