#require "pry"

class Direction
  def initialize(sym, dx, dy, left, right)
    @name, @dx, @dy, @left, @right = sym.to_s, dx, dy, left, right
    #binding.pry
  end

  def to_s
    @name
  end

  def left
    Direction.const_get(@left)
  end

  def right
    Direction.const_get(@right)
  end

  def advance(x, y)
    [x + @dx, y + @dy]
  end

  @all = [
    [:EAST,  +1,  0],
    [:NORTH,  0, +1],
    [:WEST,  -1,  0],
    [:SOUTH,  0, -1],
  ]
  @all.each_with_index do |(sym, dx, dy), i|
    self.const_set(sym,
                   Direction.new(sym, dx, dy, @all[(i + 1) % @all.size].first,
                                              @all[(i - 1) % @all.size].first))
  end

  def self.[](name)
    Direction.const_get(name) if Direction.const_defined?(name)
  end
end
