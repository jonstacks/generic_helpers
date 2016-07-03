
RSpec.describe GenericHelpers::Attributes::Base do
  let(:klass) do
    Class.new do
      include GenericHelpers::Attributes::Base
    end
  end

  let(:options) { [:size, :align, :layout, :context] }
  let(:duplicate_options) { [:size, :align, :layout, :context, :size, nil] }

  describe '.option' do
    it 'sets the unique options for the class' do
      duplicate_options.each { |o| klass.option(o) }
      expect(klass.options).to match_array(options)
    end
  end

  describe '.options' do
    before do
      options.each { |o| klass.option(o) }
    end

    it 'returns a list of options' do
      expect(klass.options).to match_array(options)
    end
  end
end
