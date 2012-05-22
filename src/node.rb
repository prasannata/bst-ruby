#!/usr/bin/ruby

class Node
  def initialize(value)
    @left = nil
    @right = nil
    @value = value
  end

  def to_s
    str = "value=#@value"
    left == nil ? str +=" left=nil" : str += " left=#{@left.value}"
    right == nil ? str +=" right=nil" : str += " right=#{@right.value}"
    return str
  end

  attr_accessor :value, :left, :right
end
