#! ruby -w

###
# Jak przeslonic/zmodyfikowac metode, ale jednoczesnie moc uzyc jej poprzedniej wersji?
class Fixnum
	alias old_plus +		# mamy alias
	
	def +(other)
		# PSIKUS!
		old_plus(other).succ
	end
end

puts 1 + 5


###
# Jak zwrocic wiecej niz 1 wartosc przy wywolaniu metody?
def many_results(n)
	return 1, n /2, n
end

p many_results 11          # wyniki sa zwracane w tablicy