require './node'

FOUR  = Node.new('4')

FIVE  = Node.new('5', [Path.new(FOUR, 6)])

SIX   = Node.new('6', [Path.new(FIVE, 9)])

THREE = Node.new('3', [])
THREE.add_path(SIX, 2)
THREE.add_path(FOUR, 11)

TWO   = Node.new('2', [])
TWO.add_path(THREE,10)
TWO.add_path(FOUR,15)

ONE  = Node.new('1', [])
ONE.add_path(SIX, 14)
ONE.add_path(TWO, 7)
ONE.add_path(THREE, 9)

SIX.add_path(ONE, 14)
SIX.add_path(THREE, 2)

FOUR.add_path(FIVE, 6)
FOUR.add_path(THREE, 11)
FOUR.add_path(TWO, 15)

FIVE.add_path(SIX, 9)

SIX.add_path(THREE, 2)
SIX.add_path(ONE, 14)

THREE.add_path(ONE, 9)
THREE.add_path(TWO, 10)

TWO.add_path(ONE, 7)
