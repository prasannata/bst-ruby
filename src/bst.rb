#!/usr/bin/ruby
require "#{File.dirname(__FILE__)}/node"

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
    elements = Array.new
    traverse(@root, elements)
    return elements
  end

  def traverse(node, elements)
    if node != nil
      traverse(node.left, elements)
      elements.push(node)
      traverse(node.right, elements)
    end
  end

  private :traverseAndAdd, :traverse, :searchValue
end

