#! ruby -w

text = "Kokoro anata to kankaku ga chirabatte. atashi wa mada jouzu ni."

case text
when /k.*k.*k/:
	puts "Sa 3 k"
when /tashi/
	puts "Jest tashi"
else
	puts "Nic nie ma"
end