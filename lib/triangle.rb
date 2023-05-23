
class Triangle
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    check_for_triangle_validity
  end

  def kind
    if @side1 == @side2 && @side2 == @side3
      :equilateral
    elsif @side1 == @side2 || @side2 == @side3 || @side1 == @side3
      :isosceles
    else
      :scalene
    end
  end

  private

  def check_for_triangle_validity
    triangle_sides = [@side1, @side2, @side3]
    raise TriangleError if triangle_sides.include?(0) || triangle_sides.any? { |side| side < 0 }
    raise TriangleError if triangle_sides.max >= triangle_sides.sum - triangle_sides.max
  end

  class TriangleError < StandardError
    def message
      "Error triangle"
    end
  end
end
