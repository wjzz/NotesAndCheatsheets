#! ruby -w

require 'hpricot'
require 'open-uri'

url = "http://helion.pl/ksiazki/prruby.htm"

doc = Hpricot( open(url) )

# wyciaganie opisu ksiazki
# print (doc/"#opis_ksiazki").inner_html

# wyciaganie spisu tresci
# print (doc/"#spis_tresci").inner_html

# wyciaganie adresu obrazka
pp doc.search("table#topbook").at("img")['src']

# Wyciaganie tytulu ksiazki
pp doc.search('table#topbook').at('h1').inner_html

# wyciaganie liczby stron
str = doc.search('table#topbook').inner_html

if str =~ /Stron:\s+(\d+)/ then
	puts $1
end

# Wyciaganie nazwisk autorow
str = doc.search('table#topbook').at('b').inner_html

if str =~ /(Autor|Autorzy): (.+)$/ then
	puts $2.gsub(/<.+?>/,'')
end