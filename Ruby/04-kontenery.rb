#! ruby -w

###
# Tablice
a = [3.14, "ciasto", 101]
puts a.length
puts a[2]

puts a[3]	# wyjscie poza tablice powoduje zwrocenie nil

puts a[-1]	# ostatni element

# w razie potrzeby tablica sama sie wydluza (jak w perlu)
a[5] = 123
p a

# rozne sposoby na wycinki tablicy
p a[2, 3]      # 3 elementy zaczynajac od tego o numerze 2
p a[2..4]      # elementy o indeksach od 2 do 4
p a[0...-1]    # elementy o indeksach od 0 do (-1) - 1 (ostatni jest pomijany)

# mozemy zmieniac wartosci albo wstawiac cale tablice
a[4] = 4
p a

a[3] = [1,2,3,4]
p a

a[1..3] = [1,2,3,4,5,6,0]
p a

# usuwanie i dodawanie na poczatku/koncu
a.pop        # usuwa i zwraca ostatni element
p a

a.shift     # usuwa i zwraca pierwszy element
p a

a.push('koniec')        # dodaje element na koniec
a.unshift('poczatek')   # dodaje element na poczatek
p a

###
# Przydatne iteratory

# wyszukiwanie elementu spelniajacego predykat
puts [1,2,3,4,5,6,7,8,9,10].find { |n| n ** 2 + 1 > 8 }

# wykonywanie czegos na wszystkich elementach
(1..15).each { |n| puts n**2 + 1 }

# mapowanie
p [1,6, 32].collect { |n| n*(n+1) }

# foldowanie
p (1..11).inject(1) { |acc, n| acc * n }   # foldl
p (1..10).inject { |acc, n| acc + n }      # foldl1

###
# jak przekazac wszystkie argumenty funkcji gdzies dalej?
def hello_and_bye(*args)
    puts "Hello!"
    puts (*args)
    puts "Bye!"
end

hello_and_bye("Jestem w srodku!")

###
# bloki
# jak sprawdzic czy podano blok?
def block_tester
    if block_given?
        puts "Mamy go!"
        yield
    else
        puts "We've lost him"
    end
end

block_tester
block_tester { puts "We're there!" }

# jak zapisac blok?
def block_grabber(&action)      # & sprawi, ze blok zostanie przeksztalcony na obiekt Proc
   puts "Blok zlapany!"
   
   # wywolanie obiektu Proc
   action.call 
end

block_grabber { puts "i-am-a-block" }

# a jak bezposrednio przeksztalcic blok na obiekt Proc? lambda!
p (lambda {|n| puts "Once upon a time, I WAS a block!" }).class