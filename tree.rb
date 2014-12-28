class Tree
  attr_reader :base

  def initialize
    @base = create_base
  end

  def create_base
    output = []
    10.times do
      row = []
      100.times do
        row << "_"
      end
      output << row
    end
    output[0][output[0].length / 2] = "1"
    output
  end

  def create_tree(num, tree=base)
    if num == 0
      return tree
    else
      create_tree(num - 1, create_new_tree(tree))
    end
  end

  def create_new_tree(tree)
    tree.map.with_index do |row, index|
      if !row.any? { |element| element == "1" }
        create_fork(tree[index - 1])
      else
        row
      end
    end
  end

  def create_fork(previous)
    indices = previous.each_index.select { |i| previous[i] == "1" }
    new_indices = create_new_indices(indices)
    create_new_row(new_indices)
  end

  def create_new_indices(indices)
    output = []
    indices.each do |i|
      output << i - 1
      output << i + 1
    end
    output
  end

  def create_new_row(new_indices)
    row = []
    100.times { row << "_" }
    row.map.with_index do |e, i|
      if new_indices.any? { |index| index == i }
        "1"
      else
        e
      end
    end
  end

  def self.print_tree(tree)
    tree.each do |row|
      row.each do |element|
        print element
      end
      print "\n"
    end
    print "\n"
  end
end

basic0 = Tree.new.create_tree(0)
basic1 = Tree.new.create_tree(1)
basic2 = Tree.new.create_tree(2)
basic3 = Tree.new.create_tree(8)
Tree.print_tree(basic0)
Tree.print_tree(basic1)
Tree.print_tree(basic2)
Tree.print_tree(basic3)
