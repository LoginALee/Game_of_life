class Cell
  attr_accessor :status
  def initialize
    @status = 'Dead'
  end

  def is_alive
    if @status == 'Alive'
      return true
    else
      return false
    end
  end

  def get_print_char
    if is_alive()
      return 'O'
    else
      return 'X'
    end
  end
end
