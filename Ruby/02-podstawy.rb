#! ruby -w
# Dodanie -w wlacza ostrzezenia

puts 'Hello'

# Inaczej niz w Pythonie, ale tak jak w Perlu, JEST roznica miedzy uzyciem apostrofow a cudzyslowow
# Tekst miedzy apostrofami NIE jest interpretowany
puts 'Hello\nMan!'
puts "Hello\nMan!"

# Wewnatrz cudzyslowow mozemy uzyc konstrukcji #{ wyrazenie }. Spowoduje to wstawienie w podanym miescu wartosci wyrazenia.
puts "Witaj po raz #{ 2+2*2 }!"

###
# Przykladowa deklaracja funkcji
# Slowo return nie jest potrzebne, zwracana jest wartosc ostatniego wyrazenia
def say_goodnight(name)
  "Dobranoc #{ name.capitalize }"
end


puts say_goodnight("wojtku")

# Funkcja rekurencyjna
def factorial(n)
  if n <= 1 then
    1
  else
    n * factorial(n-1)
  end
end

puts factorial(6)

# to samo, ale krocej
def short_factorial(n)
  n <= 1 ? 1 : n * short_factorial(n - 1)
end

puts short_factorial(100)

###
# literal tablicowy
tab = [ 1, 'abc', 5.33]

puts tab # wypisuje kazdy element w osobnym wierszu
p tab    # wypisuje tak jak literal
puts tab[0] # wypisuje pierwszy element tablicy

# zamiast zabawy z apostrofami
# ['aab', 'asdf', 'faba']
# mamy cytowanie:
tab2 = %w{ abc hello czesc }

###
# literal haszowy
assoc = {
  'abc' => 'bca',
  'bab' => 'dfa'
}

p assoc
puts assoc['abc']
puts assoc['nie ma mnie!']       # jezeli nie ma klucza, to domyslnie zwracana jest wartosc nil

# Mozemy zmienic domyslna wartosc
liczenie_slow = Hash.new(0)
puts liczenie_slow['Wojtek']
puts (liczenie_slow['Wojtek'] += 1)

###
# Petla while jako modyfikator wyrazenia
binary = 1
binary *= 2 while binary < 1_000_000

puts binary

###
line = "Lubie jezyki skryptowe takie jak Perl, Python i Ruby, ale Haskell tez jest ok!"

# sprawdzamy czy napis pasuje do wzorca
if line =~ /Perl|Python/ then
  puts "Lubimy jezyki skryptowe, co?"
end

# robimy podmiane globalna (sub zamiast gsub robimy tylko pierwsze podstawienie)
puts line.gsub(/Perl|Python/, 'C#')

###
# Przykladowa iteracja i uzycie bloku
tab2.each do |name|
  puts "Hello, #{name}!"
end

11.times { puts "I won't loop unpurposely." }

###
# Mamy starego, dobrego printfa...
printf("Dnia %03d zjadlem %s.\n", 5, "paluszki rybne.")

# A jak pobrac cos od usera?
puts "Napisz cos..."
# gets
puts "Napisales #{ gets.chomp.length } znakow."