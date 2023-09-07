require_relative '../nameable'

describe Nameable do
  describe '#correct_name' do
    it 'raises NotImplementedError' do
      nameable_instance = described_class.new
      expect do
        nameable_instance.correct_name
      end.to raise_error(NotImplementedError, 'You must implement the correct_name method')
    end
  end
end
