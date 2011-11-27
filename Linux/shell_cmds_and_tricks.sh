# Polecenia linuksowe - sciaga

~ 
# rozwija sie do sciezki katologu domowego biez. uzytkownika

cd
# rownowazne cd ~
cd katalog
# przechodzi do katalogu

whatis CMD
# wypisuje opis polecenia wygen. na podst. manow


pwd
# drukuje nazwe biezacego katalogu


ls katalog
# wypisuje zawartosc katologu
ls 
# rownowazne ls ~
# opcje:
ls -l
# wyswietlanie szczegolowych informacji (prawa dostepow, wlasciciel, rozmiar, data utworzenia)
ls -R
# wyswietlanie rekurencyjnie zawartosci podkatalogow
ls -a
# wyswietlanie wszystkich plikow (o nazwach zaczynajacych sie od kropki)	
ls -d
# wyswietlanie tylko nazw katalogow bez zawartosci


mkdir katalog
# tworzy pusty katalog
mkdir -p katalog
# tworzy strukture katalogow


# uprawnienia dostepu
chmod -R ugo+rwX katalog # rekurencyjnie(R) dodaj (+) wszystkim (ugo) pisanie, czytanie i ogladanie katalogow (kolejno wrX)


evince plik.pdf
# przegladarka plikow pdf

totem plik.video
# odtwarzac filmow

### Status systemu

free
# wyswietla informacje o wolnej pamieci

df
# wyswietla raport wolnego i zajetego miejsca na dysku

du
# szacuje liczbe wolnego miejsca na dysku

iostat
# status urzadzen we/wy

vmstat
# status pamieci wirtualnej

fdisk
# obsluga tablicy partycji

ps
# wyswietla liste procesow

top
# wyswietla informacje o procesach CPU

jobs
# wyswietla liste podprocesow

### Statystyki plikow

wc
# wyswietla informacje o liczbie wierszy, slow  bajtow
wc -l
# wyswietla liczbe wierszy

nl
# numeruje kolejne wiersze pliku


### Informacje o poleceniach

makewhatis
# aktualizuje baze danych whatis


### Informacje o userach

who
# wyswietla informacje o zalogowanych uzytkownikach

w
# wyswietla informacje o zal. uzyt. i o tym co robia

finger
# wyswietla informacje o uzytkownikach

last
# historia logowan do systemu

### Inne

vimtutor
# tutorial vima, ktory na razie nie dziala

### stdin, stdout, stderr
0< stdin
1> stdout
2> stderr
>> appendowanie
2>>

**********
*  Bash  *
**********

@ Reading from stdin line-by-line

while line
do
	echo $line
done 

@ Finding files with certain lines
find dir -name 'name_pattern' | xargs grep 'pattern_in_file'
i.e.
  find Dropbox/Programy/Haskell/ -name '*.hs' | xargs grep 'Parsec'

0. shell shortcuts

Control-l 
  equiv. to clear
Shift-PgUp/PgDown
  scroll up/down

1. script run at startup

/etc/rc.local

2. bash tricks and useful commands

# shows disk usage
df -h
