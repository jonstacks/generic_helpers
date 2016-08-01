
RSpec.describe GenericHelpers::Attributes::Tag do
  let(:klass) do
    Class.new do
      include GenericHelpers::Attributes::Tag
    end
  end

  describe '.tag' do
    context 'when not set' do
      it 'defaults to :div' do
        expect(klass.tag).to eq(:div)
      end
    end
  end

  describe '.default_tag' do
    let(:tag) { :span }

    it 'allows for setting the default tag' do
      klass.default_tag(tag)
      expect(klass.tag).to eq(tag)
    end
  end

  describe '.options' do
    it 'has a size option' do
      expect(klass.options).to include(:tag)
    end
  end

  describe '#tag' do
    before do
      klass.default_tag(:span)
    end

    subject(:component) { klass.new }

    context "when the component's tag hasn't been changed" do
      it 'returns the classes default tag' do
        expect(subject.tag).to eq(:span)
      end
    end

    context "when the component's tag has been changed" do
      it "returns the component's set tag" do
        subject.tag = :section
        expect(subject.tag).to eq(:section)
      end
    end
  end
end
