class Constants

  attr_reader :width, :height, :title, :square_size, :qtd_bombs, :fps

  def initialize(width, height, title, grid_size, qtd_bombs, fps)
    @width = width
    @height = height
    @title = title
    @grid_size = grid_size
    @square_size = @width / @grid_size
    @qtd_bombs = qtd_bombs
    @fps = fps
  end

end
