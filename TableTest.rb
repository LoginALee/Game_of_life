class TableTest
  def initialize
    @grid = [['A', 'B', 'C'],
             ['D', 'E', 'F'],
             ['G', 'H', 'I'],
             ['J', 'K', 'L']]
  end

  def print_grid
    for row in @grid
      p row
    end
  end

end
