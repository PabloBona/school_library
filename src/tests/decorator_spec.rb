require_relative '../decorator'

class DummyNameable
  def correct_name
    'Dummy Name'
  end
end

describe Decorator do
  before :each do
    @dummy_nameable = DummyNameable.new
    @decorator = Decorator.new(@dummy_nameable)
  end

  describe '#new Decorator' do
    it 'should create a new Decorator object' do
      expect(@decorator).to be_an_instance_of Decorator
    end

    it 'should set the nameable attribute' do
      expect(@decorator.nameable).to eq(@dummy_nameable)
    end
  end

  describe '#correct_name' do
    it 'should return the correct name from the decorated object' do
      expect(@decorator.correct_name).to eq('Dummy Name')
    end
  end
end
