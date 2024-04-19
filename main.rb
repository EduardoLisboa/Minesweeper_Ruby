require "ruby2d"

require_relative 'constants'
require_relative 'images'
require_relative 'board'
require_relative 'game'

# def draw_grid
#   clear
#   (0..@CONSTANTS.width).step(@CONSTANTS.square_size) do |x|
#     # Horizontal lines
#     Line.new(
#       x1: x, y1: 0,
#       x2: x, y2: @CONSTANTS.height,
#       color: '#464646'
#     )
#     # Vertical lines
#     Line.new(
#       x1: 0, y1: x,
#       x2: @CONSTANTS.width, y2: x,
#       color: '#464646'
#     )
#   end
# end

def parse_click(event)
  x, y = event.x, event.y

  mouse_x = x / @CONSTANTS.square_size
  mouse_y = y / @CONSTANTS.square_size

  if mouse_x > 19
    mouse_x = 19
  end
  if mouse_y > 19
    mouse_y = 19
  end

  [mouse_x, mouse_y]
end

# def handle_end_game(board, win)
#   board.draw_grid
#   if win
#     board.print_text("YOU WIN!")
#   else
#     board.print_text("YOU LOSE!")
#   end
#   show
#   sleep(3)
#   play_game
# end

# def right_click(x, y)
#   board.game_board[x, y].switch_flag
# end

# def left_click(x, y)
#   bomb = board.game_board[x, y].click
#   if bomb
#     handle_end_game(board, false)
#   end
# end

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
      # right_click(x, y)
      puts "Right click"
    end
  end
end

@constants = Constants.new
@images = Images.new

def settings
  set title: @constants.title
  set icon: @images.bomb_icon
  set width: @constants.width, height: @constants.height + 50
end

settings
Game.new
show
