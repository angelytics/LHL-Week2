class Board

  MAX_X = 9

  # Types of Ship
  BATTLESHIP = 'B'
  DESTROYER  = 'D'
  CRUISER    = 'C'
  EMPTY      = '~'

  # The grid below represents the game grid. It's a hash of arrays of strings. 
  # Don't let the weird syntax confuse you. It's just a fancy way of defining an 
  # array of strings. Each row is actual an array of strings. Each spot is either 
  # empty (~) or has a ship: Battleship (B), Destroyer(D), or Cruiser(C).
  
  GRID = {
    #     0 1 2 3 4 5 6 7 8 9
    A: %w{~ ~ ~ C ~ ~ ~ B ~ ~},
    B: %w{~ ~ ~ C ~ ~ ~ B ~ ~},
    C: %w{~ ~ ~ ~ ~ ~ ~ B ~ ~},
    D: %w{~ ~ ~ ~ ~ ~ ~ B ~ ~},
    E: %w{~ ~ C C ~ ~ ~ ~ ~ ~},
    F: %w{~ ~ ~ ~ ~ D D D D ~},
    G: %w{~ ~ ~ ~ ~ ~ ~ ~ ~ ~}
  }
  
  class << self

    def play(coordinates)
      array = coordinates.split("", 2)
      row = array[0]
      col = array[1]
      
      if off_the_board?(row, col)
        raise OffBoardError, "#{row}#{col} is off the board."
      else
	    place_on_board = GRID[row.to_sym][col.to_i - 1]
        case place_on_board
	    when BATTLESHIP then Battleship.new
	    when DESTROYER then Destroyer.new
	    when CRUISER then Cruiser.new
	    when EMPTY then nil
	    else 
	      nil
	    end
	  end
    end
    
    def off_the_board?(row, col)
      col.to_i <= 0 || col.to_i > 10  
     # couldn't figure out the logic here
    end
  end
end
