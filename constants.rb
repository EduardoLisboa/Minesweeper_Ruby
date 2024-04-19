class Constants

  attr_reader :width, :height, :title, :grid_size, :qtd_bombs, :fps, :square_size

  def initialize(width=600, height=600, title='Minesweeper', grid_size=20, qtd_bombs=60, fps=60)
    @width = width
    @height = height
    @title = title
    @grid_size = grid_size
    @square_size = width / grid_size
    @qtd_bombs = qtd_bombs
    @fps = fps
  end

end
