require './lib/classes.rb'

describe 'Player' do
  describe '#play' do
    it 'pushes player token to the end of the column' do
      new_game = Game.new
      new_game.p1.play(5)
    end
  end
end
