class TreeNode
  attr_accessor :value, :children, :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def add_child(child)
    children << child
    child.parent = self
    child
  end

  def dfs(target = nil, &block)

    if block_given?
      begin
        return self if block.call(self.value)
      rescue
        puts "Bad block!"
      end
    else
      return self if self.value == target
    end

    children.each do |child|
      child_node = child.dfs(target, &block)
      return child_node if child_node
    end

    nil
  end

  def bfs(target = nil, &block)
    search_queue = [self]

    until search_queue.empty?

      tester = search_queue.shift

      passed_block = block_given? && block.call(tester.value)

      if passed_block || tester.value == target
        return tester
      else
        tester.children.each { |child| search_queue << child }
      end
    end

    nil
  end

  def path
    current_node = self
    path_values = [current_node.value]

    while current_node.parent
      path_values.unshift(current_node.parent.value)
      current_node = current_node.parent
    end

    path_values
  end

end