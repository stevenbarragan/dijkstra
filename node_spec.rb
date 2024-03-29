require './graph_example'
require 'pry'

# Assign to every node a tentative distance value: set it to zero for our initial
#   node and to infinity for all other nodes.
# Mark all nodes unvisited. Set the initial node as current.
#   Create a set of the unvisited nodes called the unvisited set
#   consisting of all the nodes except the initial node.
# For the current node, consider all of its unvisited neighbors and calculate their
#   tentative distances.
#   For example, if the current node A is marked with a distance of 6, and the edge connecting it with a neighbor B has length 2,
#   then the distance to B (through A) will be 6+2=8. If this distance is less than the previously recorded tentative distance of B,
#   then overwrite that distance. Even though a neighbor has been examined, it is not marked as "visited" at this time, and it remains
#   in the unvisited set.
# When we are done considering all of the neighbors of the current node, mark the current node as visited and remove it from the unvisited set.
#   A visited node will never be checked again.
# If the destination node has been marked visited (when planning a route between two specific nodes) or if the smallest tentative distance among
#   the nodes in the unvisited set is infinity (when planning a complete traversal), then stop. The algorithm has finished.
# Select the unvisited node that is marked with the smallest tentative distance, and set it as the new "current node" then go back to step 3.
#

describe Node do
  context 'initial values' do
    let(:subject){ Node.new('B') }

    it 'set value to infinity' do
      expect(subject.value).to eq Float::INFINITY
    end

    it 'set visited? as false' do
      expect(subject.visited?).to be_false
    end
  end

  context 'has paths' do
    let(:paths){ [Path.new(Node.new('B'))] }
    let(:subject){ Node.new('A', paths) }

    it 'has has one node in paths' do
      expect(subject.paths[0]).to be_kind_of Path
    end
  end
end

describe Path do
  context 'starts with value zero' do
    let(:subject){ Path.new(Node.new('A')) }

    it 'starts with value zero' do
      expect(subject.value).to eq 0
    end
  end
end

describe Universe do
  describe '#get_betther_way' do
    let(:subject){ Universe.new(@current,@unvisited) }

    before do
      nodes = Sample.load
      @current = nodes.shift
      @unvisited = nodes
    end

    context 'between two close nodes' do
      it 'return the less cost way' do
        expect(subject.get_better_way(@current).node.name).to eq '2'
      end
    end
  end

  describe '#find' do
    let(:subject){ Universe.new(@current,@unvisited) }

    before :each do
      nodes = Sample.load
      @five = nodes[4]
      @two  = nodes[1]
      @six  = nodes[5]
      @four = nodes[3]
      @current = nodes.shift
      @unvisited = nodes
    end

    context 'between two close nodes' do
      it 'return the less cost way' do
        expect(subject.find_way(@two).last.name).to eq '2'
      end
    end

    context 'between tree levels' do
      it 'return the less cost way between tree levels' do
        path = subject.find_way(@six)
        expect(path.map &:name).to eq ["1", "2", "3", "6"]
      end
    end

    context 'between four levels' do
      it 'return the less cost way between tree levels' do
        path = subject.find_way(@five)
        expect(path.map &:name).to eq ["1", "2", "3", "6", "5"]
      end
    end

    context 'between four levels' do
      it 'return the less cost way between tree levels' do
        path = subject.find_way(@four)
        expect(path.map &:name).to eq ["1", "2", "3", "6", "5", "4"]
      end
    end
  end
end
