
root = Node.new('1',[
    Path.new(Node.new('2'), 7),
    Path.new(Node.new('3'), 9),
    Path.new(Node.new('4'), 7),
  ])

four  = Node.new('4')
five  = Node.new('5', [Path.new(four, 6)])
six   = Node.new('6', [Path.new(five, 9)])
three = Node.new('3', [Path.new(six, 2 ),])

