require './node'

four  = Node.new('4')

five  = Node.new('5', [Path.new(four, 6)])

six   = Node.new('6', [Path.new(five, 9)])

three = Node.new('3', [])
three.add_path(six, 2)
three.add_path(four, 11)

two   = Node.new('2', [])
two.add_path(three,10)
two.add_path(four,15)

one  = Node.new('1', [])
one.add_path(six, 14)
one.add_path(two, 7)
one.add_path(three, 9)

six.add_path(one, 14)
six.add_path(three, 2)

four.add_path(five, 6)
four.add_path(three, 11)
four.add_path(two, 15)

five.add_path(six, 9)

six.add_path(three, 2)
six.add_path(one, 14)

three.add_path(one, 9)
three.add_path(two, 10)

two.add_path(one, 7)
