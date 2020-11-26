class Game
  attr_accessor :grid

  def initialize
    @p1 = create_player('Josh', 'X')
    @p2 = create_player('Sam', 'O')
    @grid = Array.new(7, Array.new(6, '-'))
  end

  def create_player(name, token)
    Player.new(name, token)
  end
end

class Player
  attr_reader :name, :token

  def initialize(name, token)
    @name = name
    @token = token
  end
end
