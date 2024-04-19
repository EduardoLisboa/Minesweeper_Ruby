require 'ruby2d'

require_relative 'constants'
require_relative 'images'
require_relative 'spot'

class Board

  def initialize
    @game_board = create_board
    @constants = Constants.new
    @images = Images.new
    start_game
  end

  def start_game
    create_bombs
    update_neighbors
    draw_grid
    # draw_board
  end

  def create_board
    board = []
    (0...20).each do |row|
      board << []
      (0...20).each do |col|
        board[row] << Spot.new(row, col)
      end
    end
    board
  end

  def create_bombs
    (0..@constants.qtd_bombs).each do |_|
      row = rand(0..19)
      col = rand(0..19)
      while @game_board[row][col].is_bomb
        row = rand(0..19)
        col = rand(0..19)
      end
      @game_board[row][col].is_bomb = true
      @game_board[row][col].image = @images.IMG_HASH['bomb']
    end
  end

  def update_neighbors
    @game_board.each do |row|
      row.each do |spot|
        spot.update_neighbors(@game_board)
        spot.calc_number
      end
    end
  end

  def draw_grid
    Square.new(
      x: 0, y: 0,
      size: @constants.width,
      color: 'black',
      z: 0
    )
    (0..@constants.width).step(@constants.square_size) do |x|
      # Horizontal lines
      Line.new(
        x1: x, y1: 0,
        x2: x, y2: @constants.height,
        color: '#464646'
      )
      # Vertical lines
      Line.new(
        x1: 0, y1: x,
        x2: @constants.width, y2: x,
        color: '#464646'
      )
    end
  end

  def draw_board(reveal_bombs=false)
    draw_grid
    @game_board.each do |row|
      row.each do |spot|
        if spot.clicked or spot.is_flagged
          spot.draw
        end
        if reveal_bombs and spot.is_bomb
          spot.image = @images.IMG_HASH['bomb']
          spot.draw
        end
      end
    end
  end

  def all_bombs_flagged
    bombs_flagged = 0
    not_bombs_clicked = 0
    @game_board.each do |row|
      row.each do |spot|
        if spot.is_bomb && spot.is_flagged
          bombs_flagged += 1
        end
        if !spot.is_bomb && spot.clicked
          not_bombs_clicked += 1
        end
      end
    end

    not_bombs_spaces = @constants.grid_size**2 - @constants.qtd_bombs

    bombs_flagged == @constants.qtd_bombs || not_bombs_clicked == not_bombs_spaces
  end

  def count_bombs_left
    bombs_flagged = 0
    @game_board.each do |row|
      row.each do |spot|
        if spot.is_flagged
          bombs_flagged += 1
        end
      end
    end

    bombs_diff = @constants.qtd_bombs - bombs_flagged
    bombs_diff >= 0 ? bombs_diff : 0
  end

  def handle_bombs_left
    bombs_left = Board.count_bombs_left
    Text.new(
      "BOMBS LEFT: #{bombs_left}",
      x: 0, y: @constants.height,
      size: 40,
      color: 'white',
      z: 10
    )
  end

  def print_text(text)
    Text.new(
      text,
      x: @constants.width / 2 - 100, y: @constants.height / 2,
      size: 100,
      color: 'white',
      z: 10
    )
  end

end
