class Cell
  attr_accessor :status
  def initialize
    @status = (rand(2)) == 1
  end
  
  def get_print_char
    alive? ? 'O' : 'X'
  end

  private

  def alive?
    @status
  end
end
