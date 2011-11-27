#! ruby -w

### Ogladamy co w klasie IO piszczy

# Otwieranie pliku
file = File.new("testfile", "w")        # tryb do pisania. tryb do czytania to 'w'
file.write("Plik testowy.\nDruga i ostatnia linia.")
file.close()

# Poprzedni sposob jest prosty, ale 1. sami musielismy dopilnowac zamkniecia pliku
# 2. Jezeli wystawil jakis wyjatek, to plik moze nie byc zamkniety

# Fear no more! Jest specjalny idiom:
# Ruby zamknie plik automatycznie.
File.open("testfile", "r") do |file|
    while line = file.gets
        puts line
    end
end

# Rozne iteratory do szalenia po plikach
File.open("testfile", "r") do |file|
    # Bajt po bajcie
    file.each_byte { |byte| putc byte; print "." }
end
puts

File.open("testfile", "r") do |file|
    # Linia po linii ... chyba, ze zmienimy separator!
    file.each_line(" ") { |token| puts token}
end
# Otwierania pliku, zeby iterowac po jego wierszach to typowa operacja
# Zamiast pisac

# File.open('test') do |file|
#   file.each_line do |line|
#       # something
#   end
# end

# mamy to samo krocej
IO.foreach("testfile") { |line| puts line }

# Na koniec - jak pobierac strony z sieci?
require 'net/http'

h = Net::HTTP.new('www.ii.uni.wroc.pl', 80)
response = h.get('/cms/', nil)
if response.message == "OK"
    puts response.body
end

# Jak to zrobic fajniej?

require 'open-uri'

open('http://www.wp.pl') do |f|
    puts f.read.scan(/<a href="(.+?)">/m)
end