require 'ruby2d'

require_relative 'board'
require_relative 'constants'
require_relative 'images'

class Game

  attr_reader :board

  def initialize
    @images = Images.new
    @constants = Constants.new
    @board = Board.new
    # @board.draw_grid
    # play_game
    puts "Game initialized"
  end

  def draw_board
    @board.draw_board
  end

end
