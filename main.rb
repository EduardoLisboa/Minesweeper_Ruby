require "ruby2d"

require_relative 'constants'
require_relative 'images'

@IMAGES = Images.new
@CONSTANTS = Constants.new(
  width=600,
  height=600,
  title="Minesweeper",
  grid_size=20,
  qtd_bombs=60,
  fps=60
)

def settings
  set title: @CONSTANTS.title
  set icon: @IMAGES.bomb_icon
  set width: @CONSTANTS.width, height: @CONSTANTS.height + 50
end

def draw_grid
  clear
  (0..@CONSTANTS.width).step(@CONSTANTS.square_size) do |x|
    # Horizontal lines
    Line.new(
      x1: x, y1: 0,
      x2: x, y2: @CONSTANTS.height,
      color: '#464646'
    )
    # Vertical lines
    Line.new(
      x1: 0, y1: x,
      x2: @CONSTANTS.width, y2: x,
      color: '#464646'
    )
  end
end

def parse_click(event)
  x, y = event.x, event.y

  [x / @CONSTANTS.square_size, y / @CONSTANTS.square_size]
end

def right_click(x, y)
  Image.new(
    @IMAGES.IMG_HASH['flag'],
    x: x * @CONSTANTS.square_size,
    y: y * @CONSTANTS.square_size,
    width: @CONSTANTS.square_size,
    height: @CONSTANTS.square_size,
    z: 9
  )
end


settings
draw_grid

Text.new(
  "BOMBS LEFT: #{@CONSTANTS.qtd_bombs}",
  x: 0, y: @CONSTANTS.height,
  size: 40,
  color: 'white',
  z: 10
)

on :mouse_down do |event|
  # X and Y position of the mouse
  x, y = parse_click(event)
  puts "x: #{x}, y: #{y}"

  case event.button
  when :left
    # TODO: Open square
    # left_click(x, y)
  when :right
    # TODO: Put/remove flag
    right_click(x, y)
  end
end

show
