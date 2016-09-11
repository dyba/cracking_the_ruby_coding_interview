require 'test_helper'
require 'ctci/trees_and_graphs/route_between_nodes'

class TestRouteBetweenNodes < Minitest::Test
  include CTCI::TreesAndGraphs
  include CTCI::DataStructures

  def test_connected_nodes
    root = GraphNode.new(10)
    child = GraphNode.new(5)
    root.nodes << child

    assert route_exists? root, child
  end

  def test_unconnected_nodes
    root = GraphNode.new(10)
    child = GraphNode.new(3)

    refute route_exists? root, child
  end


  def test_connected_nodes_two_hops_apart
    root = GraphNode.new(10)
    child1 = GraphNode.new(1)
    child2 = GraphNode.new(2)
    child3 = GraphNode.new(3)
    grand_child1 = GraphNode.new(4)
    grand_child2 = GraphNode.new(5)
    grand_child3 = GraphNode.new(6)

    root.nodes << child1
    root.nodes << child2
    root.nodes << child3

    child1.nodes << grand_child1
    child1.nodes << grand_child2
    child1.nodes << grand_child3

    assert route_exists? root, grand_child1
  end

  def test_unconnected_nodes_two_hops_apart
    root = GraphNode.new(10)
    child1 = GraphNode.new(1)
    child2 = GraphNode.new(2)
    child3 = GraphNode.new(3)
    grand_child1 = GraphNode.new(4)
    grand_child2 = GraphNode.new(5)
    other_root = GraphNode.new(6)

    root.nodes << child1
    root.nodes << child2

    child1.nodes << grand_child1

    other_root.nodes << child3

    refute route_exists? root, child3
  end
end
