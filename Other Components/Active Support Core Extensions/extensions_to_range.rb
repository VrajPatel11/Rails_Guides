#Extensions to Range

# ===, include?, and cover?
(2..3).include?(Math::E) # => true

(1..10) === (3..7)  # => true
(1..10) === (0..7)  # => false
(1..10) === (3..11) # => false
(1...9) === (3..9)  # => false

(1..10).include?(3..7)  # => true
(1..10).include?(0..7)  # => false
(1..10).include?(3..11) # => false
(1...9).include?(3..9)  # => false

(1..10).cover?(3..7)  # => true
(1..10).cover?(0..7)  # => false
(1..10).cover?(3..11) # => false
(1...9).cover?(3..9)  # => false

#overlaps?
#it depicts that two given ranges have non-void intersection or not
(1..10).overlaps?(7..11)  # => true
(1..10).overlaps?(0..7)   # => true
(1..10).overlaps?(11..27) # => false
