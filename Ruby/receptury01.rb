# Rozne sposoby na tworzenie podnapisow

string = "This is a simple string"

puts string.slice(10, 6)

puts string[0].chr + string[1].chr + string[2].chr + string[3].chr

puts string[10, 6]

puts string[10..16]

# Scalanie napisow/dopisywanie

s = ""         # \|/ appendowanie
30.times { |n| s << n.to_s if n.modulo(4) == 3 }
puts s

tab = []
10.upto(25) { |n| tab.push(n) if n.modulo(3) > 0 }     
puts tab.join(", ")		# scalanie tablicy