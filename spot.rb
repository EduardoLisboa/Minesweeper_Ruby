require_relative 'images'
require_relative 'constants'

class Spot

  def initialize(row, col)
    @row = row
    @col = col
    @x = @row * 30
    @y = @col * 30
    @image = @IMAGES.IMG_HASH['empty']
    @is_bomb = false
    @number = 0
    @is_flagged = false
    @clicked = false
    @neighbors = []
  end

  def get_position
    [@row, @col]
  end

  def draw
    Image.new(
      @image,
      x: @x + 2,
      y: @y + 2,
      width: 30 - 4,
      height: 30 - 4,
      z: 9
    )
  end

  def calc_number
    neighbors.each do |neighbor|
      if neighbor.is_bomb
        @number += 1
      end
    end
  end

  def update_neighbors(grid)
    @neighbor = []
    (-1..1).each do |i|
      (-1..1).each do |j|
        if i == 0 && j == 0
          next
        end
        if 0 <= @row + i && @row + i < @CONSTANTS.grid_size && 0 <= @col + j && @col + j < @CONSTANTS.grid_size
          @neighbors << grid[@row + i][@col + j]
        end
      end
    end
  end

  def click
    @clicked = true
    if @is_bomb
      true
    elsif @number > 0
      @image = @IMAGES.IMG_HASH[@number.to_s]
      false
    elsif @number == 0
      @image = @IMAGES.IMG_HASH['empty']
      neighbors.each do |neighbor|
        if !neighbor.clicked && !neighbor.is_bomb && !neighbor.is_flagged
          neighbor.click
        end
      end
      false
    end
  end

  def switch_flag
    if not @clicked
      @is_flagged = !@is_flagged
      if @is_flagged
        @image = @IMAGES.IMG_HASH['flag']
      else
        @image = @IMAGES.IMG_HASH['empty']
      end
    end
  end
end
