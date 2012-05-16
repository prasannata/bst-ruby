#!/usr/bin/ruby
require 'node'

class BST
  def initialize
    @root = nil
  end

  def add(number)
    if number != nil
      if @root == nil
        @root = Node.new(number)
      else
        traverseAndAdd(@root, number)
      end
    end
  end

  def traverseAndAdd(ancestor, number)
    if ancestor.value != number
      if number < ancestor.value
        if ancestor.left == nil
           node = Node.new(number)
           ancestor.left = node
        else
          traverseAndAdd(ancestor.left, number);
        end
      else
        if ancestor.right == nil
           node = Node.new(number)
           ancestor.right = node
        else
          traverseAndAdd(ancestor.right, number);
        end
      end
    end
  end

  def search(number)
    return searchValue(@root, number)
  end

  def searchValue(node, value)
    if node != nil
      if node.value == value
        return node
      elsif value < node.value
        return searchValue(node.left, value)
      else
        return searchValue(node.right, value)
      end
    end

    return nil
  end

  def walk
    traverse(@root)
  end

  def traverse(node)
    if node != nil
      puts node
      traverse(node.left)
      traverse(node.right)
    end
  end

  private :traverseAndAdd, :traverse, :searchValue
end

bst = BST.new
bst.add(10)
bst.add(20)
bst.add(2)
bst.add(1)

print "Walk tree\n"
print "=========\n"
bst.walk
print "\n"

print "Search tree\n"
print "===========\n"
puts bst.search(10)
puts bst.search(2)
puts bst.search(15)
print "\n"
