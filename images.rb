class Images

  attr_reader :bomb_icon, :IMG_HASH

  def initialize
    @bomb_icon = 'assets/bomb_icon.png'

    @IMG_HASH = {
      "1" => 'assets/1.png',
      "2" => 'assets/2.png',
      "3" => 'assets/3.png',
      "4" => 'assets/4.png',
      "5" => 'assets/5.png',
      "6" => 'assets/6.png',
      "7" => 'assets/7.png',
      "8" => 'assets/8.png',
      'bomb' => 'assets/bomb.png',
      'flag' => 'assets/flag.png',
      'square' => 'assets/square.png'
    }
  end

end
