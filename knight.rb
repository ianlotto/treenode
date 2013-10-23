require './treenode'

class KnightPathFinder
  attr_accessor :move_tree, :start

  def initialize(start = [0, 0])
    @start = start
    build_move_tree
  end

  def build_move_tree
    self.move_tree = TreeNode.new(self.start)

    seen_positions = [self.start]
    node_list = [self.move_tree]

    until node_list.empty?
      current_node = node_list.shift
      current_pos = current_node.value

      possible_moves = KnightPathFinder.new_move_positions(current_pos)

      possible_moves.select! { |move| !seen_positions.include?(move) }

      possible_moves.each do |move|
        seen_positions << move
        node_list << current_node.add_child(TreeNode.new(move))
      end
    end
  end

  def find_path(target_pos)

    if target_pos.any? { |coord| !coord.between?(0,7) }
      raise RuntimeError.new "Target is off the board!"
    elsif target_pos == start
      raise RuntimeError.new "Already there!"
    end

    target_node = move_tree.bfs(target_pos)

    target_node.path
  end


  #Class Variables

  def self.new_move_positions(pos)
    new_moves = []

    8.times do |row|
      8.times do |col|
        new_moves << [row, col] if valid_move?(row, col, pos)
      end
    end

    new_moves
  end

  def self.valid_move?(row, col, pos)
    current_row, current_col = pos
    test = []
    test << (current_row - row).abs
    test << (current_col - col).abs

    test.sort == [1, 2]
  end
end

begin
  p KnightPathFinder.new.find_path([7,7])
rescue RuntimeError => e
  puts "Problem: #{e.message}"
end