#! ruby -w

###
# Liczby
# Rozne literaly calkowitoliczbowe
p 123
p 0d123       # to samo, system dziesietny
p 123_000     # podkreslenie jest ignorowane
p 0xFFFF0000  # hex
p 0100	      # octal
p 0b101010101 # binary

p ?a          # kod ASCII znaku a

# liczby zmiennoprzecinkowe
p 1.0e3         # 1.e3 nie dziala!

# iteratory
3.times { print 'ha ' }
puts

1.upto(5) { |n| puts n }

10.downto(0) { |n| print n }
puts

50.step(100, 20) { |n| puts n }

# parsowanie
a = "2134"
p a
p Integer(a)

###
# Stringi
# Jak uzyskac apostrof i lewy ukosnik wewnatrz literalu ograniczonego apostrofami?
puts 'To jest lewy ukosnik[backslash]: \\. To jest apostrof \'. '

# A co jesli chcemy jakos inaczej ograniczac ciagi znakow?
puts %q/Ten tekst jest w apostrofach 'a'a/
puts %Q/Ten jest w cudzyslowiach "13" #{8*9*5}/

# Jesli trzeba duzo cytowac to uzywamy tzw here doc:
string = <<END
    Okaeri I'm home
    Kaeru basho yeah ai wo arigatou.
END

p string
    
# Dzielenie napisu
str = "Wojciech    Jedynak    | 209078  | 0 0 0 0 1 2 3 1 0 2| 10 | 3.0"

name, indeks, points, sum, grade = str.split(/\s+\|\s+/)

# Jak polaczyc nadmiarowe spacje w jedna?
puts name.squeeze(" ") + "[]"

# Jak wydobyc liczby z napisy?
p str.scan(/\d+/)

###
# Przedzialy
(1..10).to_a      # konwersja przedzialu na tablice

###
# Wyrazenia regularne

# 3 sposoby na tworzenie obiektow klasy Regexp
# To samo na 3 sposoby
a = Regexp.new('^a\d+')
b = /^a\d+/
c = %r{^a\d+}

# dopasowywanie
if "Wojtek" =~ /W.*k/ then
    p "Moje imie zawiera W a potem k"
end

# sprawdzanie, czy re NIE pasuje
if "Wojtek" !~ /t.*t/ then
    p "Moje imie nie zawiera dwoch t"
end

# dopasowywanie zmiennych powoduje wypelnienie kilku zmiennych
# $`, $&, $' to czesci odp. przed / w / po dopasowaniu
if "Wojtek Jedynak" =~ /e(.+)e/ then
    p "#{$`}<<#{$&}>>#{$'}"
    p "W nawiasie bylo [#$1]"    # to co bylo w nawiasach jest wstawiane do $1, $2, ..., $9 jak w perlu
end

# jak dopasowac cos, co sie powtarza?
# przyklad. chcemy lapac pary takich samym tagow
code = <<END_OF_CODE
<html>
    <head>
        <title> Tytul strony </title>
    </head>
    <body>
        <p> Tresc akapitu </p>
    </body>
</html>
END_OF_CODE

code.gsub!(/\n/, '')
p code
puts

re =  /<(\w+)>(.+)<\/\1>/
while code =~ re
    p $1
    code = $2
end