require "ruby2d"

require_relative 'constants'
require_relative 'images'
require_relative 'board'
require_relative 'game'

@constants = Constants.new
@images = Images.new
@game = Game.new

def parse_click(event)
  x, y = event.x, event.y

  mouse_x = x / @constants.square_size
  mouse_y = y / @constants.square_size

  if mouse_x > 19
    mouse_x = 19
  end
  if mouse_y > 19
    mouse_y = 19
  end

  [mouse_x, mouse_y]
end

def right_click(x, y)
  @game.board.game_board[x][y].switch_flag
end

def play_game
  on :mouse_down do |event|
    # X and Y position of the mouse
    x, y = parse_click(event)
    puts "x: #{x}, y: #{y}"

    case event.button
    when :left
      # TODO: Open square
      # left_click(x, y)
      puts "Left click"
    when :right
      # TODO: Put/remove flag
      right_click(x, y)
    end

    @game.draw_board
  end
end

def settings
  set title: @constants.title
  set icon: @images.bomb_icon
  set width: @constants.width, height: @constants.height + 50
end

settings
# Game.new
play_game
show
