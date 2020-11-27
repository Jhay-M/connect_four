class Game
  @grid = Array.new(42).each_slice(6).to_a

  class << self
    attr_accessor :grid
  end

  def invalid?(int)
    int.negative? || int >= 7
  end
end

class Player < Game
  attr_reader :name, :token

  def initialize(name, token)
    @name = name
    @token = token
  end

  def play(int)
    run(int)
    check_win ? game_over : show_map
  end

  def map
    Game.grid
  end

  def show_map
    map.each { |arr| p arr }
    'Next Turn!'
  end

  def run(int)
    int -= 1
    return 'Invalid Input' if invalid?(int)
    return 'Column Full' unless map[int].include?(nil)

    i = 0
    while i < map[int].size
      if map[int][i].nil?
        map[int][i] = token
        break
      end
      i += 1
    end
  end

  def hor_wincon(i, j)
    (map[i][j] == token) && (map[i + 1][j] == token) && (map[i + 2][j] == token) && (map[i + 3][j] == token)
  end

  def ver_wincon(i, j)
    (map[i][j] == token) && (map[i][j + 1] == token) && (map[i][j + 2] == token) && (map[i][j + 3] == token)
  end

  def diagonal_left_wincon(i, j)
    (map[i][j] == token) && (map[i - 1][j + 1] == token) && (map[i - 2][j + 2] == token) && (map[i - 3][j + 3] == token)
  end

  def diagonal_right_wincon(i, j)
    (map[i][j] == token) && (map[i + 1][j + 1] == token) && (map[i + 2][j + 2] == token) && (map[i + 3][j + 3] == token)
  end

  def hor_check
    i = 0
    while i < map.size - 3
      j = 0
      while j < map[i].size
        return true if hor_wincon(i, j)

        j += 1
      end
      i += 1
    end
  end

  def ver_check
    i = 0
    while i < map.size
      j = 0
      while j < map[i].size - 3
        return true if ver_wincon(i, j)

        j += 1
      end
      i += 1
    end
  end

  def diagonal_left_check
    i = 3
    while i < map.size
      j = 0
      while j < map[i].size - 3
        return true if diagonal_left_wincon(i, j)

        j += 1
      end
      i += 1
    end
  end

  def diagonal_right_check
    i = 0
    while i < map.size - 3
      j = 0
      while j < map[i].size - 3
        return true if diagonal_right_wincon(i, j)

        j += 1
      end
      i += 1
    end
  end

  def check_win
    # Horizontal, Vertical and Diagonal checks in both directions
    return true if hor_check || ver_check || diagonal_left_check || diagonal_right_check

    false
  end

  def game_over
    puts "#{name} wins!"
    Game.grid = Array.new(42).each_slice(6).to_a
  end
end
