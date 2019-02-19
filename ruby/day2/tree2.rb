class Tree
  attr_accessor :children, :node_name

  def initialize(structure)
    # @TODO In the base case, find the name of the tree from the structure
    # @TODO In the non-base case, recurse
    # @TODO In the non-base case, store children after the are returned

    # @children = []
    # structure.each_with_index { |item, index| @node_name = index, @children.push(Tree.new(item)) }
    # structure.each_pair { |key, value| @node_name = key }
    # structure.each_pair { |key, value| @node_name = key, @children.push(Tree.new(value)) }
    # structure.each_pair { |key, value| @node_name = key, value.each { |child| @children.push(Tree.new(child)) } }

    puts '---------------'
    pp structure
    puts '---------------'


    @node_name = structure.keys[0]
    @children = []
    # @children = build_descendents(structure.values)

    # structure.values.each { |key, value| puts "#{key}: #{value}" }
    structure.each { |key, value| puts "#{key}: #{value}" }

    # structure.each { |key, value| @children.push(Tree.new(value)) unless value.empty? }
    # structure.values.each { |value| @children.push(Tree.new(value)) unless value.empty? }
    # structure.values.each { |values| values.values.each { |value| @children.push(Tree.new(value)) } unless values.empty? }

    # @children = children
    # @node_name = name
  end

  def build_descendents(structure)
    children = []

    structure.each { |value| children.push(Tree.new(value)) unless value.empty? }
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

family_tree = {
  grandpa: {
    dad: {
      child_1: {},
      child_2: {}
    },
    uncle: {
      child_3: {},
      child_4: {}
    }
  }
}

ruby_tree = Tree.new(family_tree)

pp ruby_tree

# puts 'Visiting a node'
# ruby_tree.visit {|node| puts node.node_name}
# puts

# puts 'Visiting entire tree'
# ruby_tree.visit_all {|node| puts node.node_name}
