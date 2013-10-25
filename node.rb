class Node
  attr_accessor :name, :value, :paths

  def initialize(name , paths = [])
    @value = Float::INFINITY
    @paths = paths
  end

  def visited?
    @visited
  end

  def add_path(node, value)
    @paths << Path.new(node,value)
  end
end

class Path
  attr_accessor :node, :value

  def initialize(node, value = 0)
    @node = node
    @value = value
  end
end

class Universe
  attr_accessor :current

  def initialize(current)
    @current = current
    @visited = current.paths
  end

  def find_path(nodeA, nodeB)
  end
end
