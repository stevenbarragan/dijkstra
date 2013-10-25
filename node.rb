class Node
  attr_accessor :name, :value, :paths, :visited

  def initialize(name , paths = [])
    @name = name
    @value = Float::INFINITY
    @paths = paths
  end

  def visited?
    @visited
  end

  def add_path(node, value)
    @paths << Path.new(node,value)
  end

  def nodes
    @paths.map{ |path| path.node }
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

  def initialize(current, unvisited)
    @current = current
    @current.visited = true
    @current.value = 0
    @current_value = 0

    @unvisited = current.paths
    @way = [current]
  end

  def find_way(nodeB)
    binding.pry

    find(nodeB)
    while @way.last != nodeB
      find(nodeB)
    end
    @way
  end

  def find(nodeB)
    @way << get_better_way(current,nodeB)
    mark_visited(@way.last)
  end

  def mark_visited(path)
    path.node.visited = true
    @current_value = path.node.value += @current_value
  end

  def get_better_way(nodeA,nodeB)
    nodeA.paths.select{ |path| !path.node.visited? }.min_by{ |path| path.value }
  end
end
