require_relative '../trimmer_decorator'

describe TrimmerDecorator do
  let(:nameable) { double('Nameable') }
  let(:decorator) { TrimmerDecorator.new(nameable) }

  describe '#correct_name' do
    context 'when the original name is longer than 10 characters' do
      it 'trims the name to 10 characters' do
        allow(nameable).to receive(:correct_name).and_return('12345678901')
        expect(decorator.correct_name).to eq('1234567890')
      end
    end

    context 'when the original name is 10 characters or shorter' do
      it 'returns the original name unchanged' do
        allow(nameable).to receive(:correct_name).and_return('1234567890')
        expect(decorator.correct_name).to eq('1234567890')
      end
    end
  end
end
