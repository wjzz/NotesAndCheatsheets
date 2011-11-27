#! ruby -w

###
# Funkcja, ktora moze powodowac zwrocenie wyjatku 
def append_ext(str)
    unless String === str
        raise ArgumentError, "argument musi byc typu String"
    else
        str << ".txt"
    end
end



###
# Jak przechwytywac wyjatki?
begin
    # tutaj umieszczamy niebezpieczny fragment kodu
    append_ext("123")
    append_ext(123)

rescue ArgumentError
    $stderr.print "Blad argumentu: \n" + $!
else
    raise               # powoduje ponowne zgloszenie wyjatku
end

# Co zrobic jezeli chcemy nazywac instancje lapanych wyjatkow zamiast uzywach $!?
begin
    eval "1+23*2"
rescue SyntaxError, NameError => boom
    print "Lancuch znakow nie jest kompilowalny: " + boom
rescue StandardError => bang
    print "Blad podczas wykonywania skryptu: " + bang
end

# Uwaga samo 'rescue' jest rownowazne 'rescue StandardError'

# Jak uzyskac funkcjonalnosc podobna do 'finally' z Javy i C#?
f = File.open("08-wyjatki.rb")
begin
    f.grep(/wyjatk(\w+)/) { |line| puts line }
rescue Exception
    # nic
ensure
    # to bedzie wykonane zawsze
    f.close() unless f.nil?
end

# co zrobic, jezeli jestesmy w stanie cos poprawic i chcemy od nowa wszystko przetwarzac?
# mamy od tego slowo 'retry'

def test(n)
    unless n >= 5
        raise ArgumentError, "Zbyt maly argument: #{n} < 5"
    else
        puts "Ok!"
    end
end

i = 1
begin
    test(i)
rescue ArgumentError
    puts $!
    i += 1      # naprawa
    retry
end

###
# Jak zglaszac wyjatki (juz to robilismy, zeby bylo co lapac :P)

def zlosniwa
    raise                                                # ponownie zglasza biezacy wyjatek
    raise "Houston, we've got a problem!"                # zglasza RuntimeError
    raise InterfaceException, "Blad klawiatury", caller  # ustawia komunikat i slad stosu
end