class Player

  attr_accessor :shots_fired, :max_shots_fired, :hits, :misses

  def initialize
    @shots_fired = 0
    @max_shots_fired = 10
    @hits = []
    @misses =[]
  end
  
  def fire(coordinates)
    if shots_fired < @max_shots_fired
      self.shots_fired += 1 
      action = Board.play(coordinates)
      if action.nil?
        @misses << coordinates
      else
        @hits << coordinates       
      end
      action
    else
      false
    end
  end   
end

    