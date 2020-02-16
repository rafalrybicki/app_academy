class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent)
        if @parent 
            @parent.children.reject! {|child| child == self}
        end
        @parent = parent 
        @parent.children << self unless parent == nil || @parent.children.include?(self)
    end

    def add_child(child_node)
        child_node.parent=(self)
    end

    def remove_child(child_node)
        raise 'this is root node!' if child_node.parent == nil
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if @value == target_value

        @children.each do |child|
            result = child.dfs(target_value)
            return result unless result.nil?
        end

        nil
    end

    def bfs(target_value)
        nodes = [self]

        until nodes.empty?
            node = nodes.shift
        
            return node if node.value == target_value
            nodes += node.children
        end

        nil
    end

end