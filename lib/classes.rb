class Game
  attr_accessor :grid
  attr_reader :p1, :p2

  def initialize
    @p1 = create_player('Josh', 'X')
    @p2 = create_player('Sam', 'O')
    @grid = Array.new(7, Array.new(6))
  end

  def create_player(name, token)
    Player.new(name, token)
  end

  def invalid?(int)
    int.negative? || int >= 7
  end

  def launch
    p1.play()
  end
end

class Player < Game
  attr_accessor :turns, :moves
  attr_reader :name, :token

  def initialize(name, token)
    @name = name
    @token = token
    @turns = 0
    @moves = []
  end

  def play(int)
    return 'Invalid Input' if invalid?(int)

    grid[int - 1] << token
  end
end

new_game = Game.new
p new_game
