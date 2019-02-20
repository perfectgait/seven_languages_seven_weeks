class Tree
  attr_accessor :children, :node_name

  def initialize(structure)
    @children = []

    structure.each do |key, value|
      @node_name = key

      value.each do |descendent_name, descendent_children|
        descendent_structure = Hash.new
        descendent_structure[descendent_name] = descendent_children
        @children.push(Tree.new(descendent_structure))
      end
    end
  end

  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block }
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

puts 'Visiting a node'
ruby_tree.visit {|node| puts node.node_name}
puts

puts 'Visiting entire tree'
ruby_tree.visit_all {|node| puts node.node_name}
