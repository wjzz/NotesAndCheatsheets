#! ruby -w

###
# W Ruby if oraz case sa wyrazeniami - zwracaja wartosci
a   = 123
key = if a.zero? then 1 else a end

###
# Uzywanie powloki
dir = `dir`.split("\n").find_all { |line| line =~ /\.rb/ }
puts dir.collect { |line| line =~ /[\w-]+\.rb/; $& }

# altenatywna skladnia
puts %x{ echo "Hello" }

###
# Przypisania rownolegle
a, b = 1, 1

# Kolejnosc przypisan w przypisaniach rownoleglych
class Noisy
    @@id = 0
    def initialize
        @id = @@id
        @@id += 1
    end
    
    def val=(val)
        puts @id
        val
    end
end

n1 = Noisy.new
n2 = Noisy.new
n3 = Noisy.new
n1.val, n2.val, n3.val = 1, 2, 3

puts "-" * 20

# Co gdy liczba argumentow po prawej != # argumentow po lewej?
a, b = 1, 2, 3
puts a, b

a, b, c = 1, 2      # c == nil
puts a, b, c

# pakowanie podczas przypisania rownoleglego
a, b, *c = Array(1..10)         # a i b dostana odp. 0. i 1. element tablicy, reszta trafi do c
p a, b, c

# rozpakowywanie podczas przypisania rownoleglego
a, b, c = 1, *[3, 5, 7]         # por a, b, c = 1, [3, 5, 7]
p a, b, c

###
# Prawda jest wszystko, co nie jest false albo nil.
# Metoda gets zwraca nil jesli napotka znacznik konca pliku
# Mozemy wiec pisac petli takie jak ta:
# (zakomentowane, zeby nie trzeba bylo ciagle czegos wprowadzac)

# while line = gets
#     p line.length
# end

# uwaga
if 0 then
    p "Zero jest prawdziwe => istnieje?"
else
    p "There is no zero"
end

###
# Rozne definicje rownosci
p = "123"
q = p
r = p.dup

puts p == q
puts p.equal?(q)
puts p.eql?(q)
p "-" * 20

puts p == r
puts p.equal?(r)
puts p.eql?(r)

## ==     -> sprawdzanie rownosci
## eql?   -> sprawdzanie wartosci i typow
## equal? -> sprawdzanie ID

p 1 == 1.0
p 1.eql?(1.0)

###
# Idiom
words = {}
words['key'] ||= []           # Jesli istnieje wartosc dla tego klucza to nic sie nie dzieje
                              # Jesli wartosci brak to ustawiamy ja na []

words['key'] << 'abc'         # Dopisywanie
p (words['key'] << 'def')

###
# Instrukcja warunkowa w wielu smakach
if 1==1 then
    p "Uff!"
end

if 1 > 2 then
    p "Ups!"
elsif 2 > 3 then
    p "Ups! ** 2"
else
    p "Uff!"
end

# Zamiast then mozna dac : (dwukropek)
# Mozna tez w jednej linijce

# Wersja z zanegowanym warunkiem
unless 1 == 1
    "Math doesn't make sense!"
else
    "Everything's fine."
end

# Wersja dla perlowych maniakow
print "Hi, there!" unless 5 == 3

###
# Case
# Gdy wyszlo zbyw wiele ifow...

# Wersja 1.
name = "Wojtek"

p case
  when name[-1] == 'a':    "You're a woman, ain't ya?"
  when name.length > 10:   "You've got some long name, don't ya?"
  when name =~ /^[aiueo]/: "Your name begins with a vowel, right?"
  else                     "You are just me, I guess."
  end

# Wersja 2.
p   case name
    when /a$/:  "First case"
    when /y*/:  "This is dangerous - it always works!"
    end


###
# Petle
i = 1
i = (i+1) ** 2 while i < 10**10
p i

i -= 100000000 until i < 5500
p i

# Iteratory
# filter
def is_prime?(n)
    case
    when n < 2:  
        return false
    when n == 2: 
        return true
    when n % 2 == 0: 
        return false
    else
        i = 3
        while i * i <= n
            if n % i == 0 then 
                return false 
            end
            i += 2
        end
        return true
    end
end

p ((1..100).find_all {|n| is_prime? n } )

File.open('07-wyrazenia.rb').grep(/(a.*e)|(e.*a)/) do |line|
    puts line
end

# petla nieskonczona
i = 2
loop do
    i *= 2
    break if i > 10 ** 10
end
puts i

###
# Struktury kontrolne petli
# break - konczy petle
# next  - przechodzi do nastepnej iteracji
# redo  - powtarza aktualny krok iteracji
# retry - zaczyna iteracje od poczatku. Ewaluuje od nowa argument iteratora