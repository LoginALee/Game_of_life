class Cell
  attr_accessor :status
  def initialize
    @status = (rand(2)) == 1 ? true : false
  end
  
  def get_print_char
    return 'O' if alive?
    'X'
  end

  private

  def alive?
    return @status
  end
end
