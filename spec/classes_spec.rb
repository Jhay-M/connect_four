require './lib/classes.rb'

describe Player do
  subject(:game) { described_class.new('Josh', 'X') }

  describe '#initialize' do
    it 'reads instance variables' do
      expect(game.name).to eq('Josh')
    end
  end

  describe '#show_map' do
    let(:game_map) { instance_double(Array) }

    before do
      allow(game_map).to receive(:each)
    end

    it 'sends #each to map' do
      expect(game_map).to receive(:each)
      game.show_map
    end
  end
end
