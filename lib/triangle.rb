require 'pry'

class Triangle
  # write code here
  @@all = []
  attr_accessor :side_1, :side_2, :side_3
  def initialize(side1, side2, side3)
    @side_1 = side1
    @side_2 = side2
    @side_3 = side3
  end

  def self.all
    @@all
  end

  def is_valid?
    (@side_1>0 && @side_2>0 && @side_3>0) && ((@side_1+@side_2 > @side_3) && (@side_2+@side_3 > @side_1) && (@side_1+@side_3 > @side_2))
  end

  def is_isosceles?
    bool = (@side_1 == @side_2) || (@side_2 == @side_3) || (@side_1 == @side_3)
  end

  def is_equilateral?
    bool = (@side_1 == @side_2) && (@side_2 == @side_3)
  end

  def is_scalene?
    bool = (@side_1 != @side_2) && (@side_2 != @side_3) && (@side_1 != @side_3)
  end

  def kind
    kindy = ""
    if self.is_valid?
      if self.is_equilateral?
        kindy = "equilateral"
      elsif self.is_isosceles?
        kindy = "isosceles"
      elsif self.is_scalene?
        kindy = "scalene"
      end
      kindy.to_sym
    else
      raise TriangleError
      begin
      rescue TriangleError => error
          puts error.message
      end
    end
    #binding.pry
  end

  class TriangleError < StandardError
    # triangle error code
    def message
      "Triangle non valid"
    end
  end
end
