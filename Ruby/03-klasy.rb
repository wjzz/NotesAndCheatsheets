#! ruby -w

###
# Nazwy klas piszemy wielka litera; metody, zmienne lokalne - mala
class Song
  # Konstruktor
  def initialize(name, artist, duration)
    # Zmienne zaczynajace sie od @ to zmienne instancji/egzemplarza
    @name     = name
    @artist   = artist
    @duration = duration
  end
end

# Tworzymy egzemplarz klasy i ogladamy jego wnetrznosci
song = Song.new("Fragile", "Every Little Thing", 300)      # Tworzenie obiektu
puts song.inspect
puts song.to_s    # Niezbyt zachecajace

###
# W Ruby klasy sa zawsze otwarte
# Przeciazymy wiec metode to_s

class Song
  def to_s
    "Utwor: #@name--#@artist (#@duration)"
  end
end

song = Song.new("Star", "Reamonn", 310)
puts song.to_s    # That's better!

###
# Dziedziczenie
# Kazda klasa jest potomkiem Object
class KaraokeSong < Song
  def initialize(name, artist, duration, lyrics)
    # Wywolanie metody initialize z klasy bazowej
    super(name, artist, duration)
    @lyrics = lyrics
  end
  
  def to_s
    super + " [#@lyrics]"
  end
end

# Wtracenie - dokument HERE
lyrics = <<END_OF_TEXT
  Zutto isshou ni ite
  Futari de aruite ita michi
  Futatsu ni wakarete
END_OF_TEXT

k_song = KaraokeSong.new("Mikazuki", "Ayaka", 360, lyrics)
puts k_song.to_s      # polimorfizm magic

###
# Dodajemy atrybuty do klasy Song
# Wersja reczna
class Song
  # atrybut read-only
  def name
    @name
  end
  # atrybut z prawem do pisania
  def artist
    @artist
  end
  def artist=(value)
    @artist = value
  end
end

song = Song.new('Oki tegami', 'Miki Fujimoto', 290)
puts song.name
song.artist = song.artist.split.reverse.join(' ')

puts song.to_s

# Poniewaz takie definicje atrybutow sa b. powszechne istnieje sposob na automatycznie ich
# generowanie
class Song
  attr_reader :duration      # metody typu get z Javy
  attr_writer :duration      # metody typu set z Javy
end

###
# Zmienne, metody i stale klasy (statyczne)
class PlayableSong < Song
  # zmienne klasy trzeba zainicjalizowac przed uzyciem
  @@plays = 0
  
  def initialize(name, artist, duration)
    super(name, artist, duration)
    @plays = 0
  end
  
  def play
    @plays  += 1    # Zmienna egzemplarza
    @@plays += 1    # Zmienna klasy
  end
  
  def to_s
    super + " [#@plays plays]"
  end
end

p_song = PlayableSong.new("Shine", "Onitsuka Chihiro", 342)
p_song.play
p_song.play
puts p_song.to_s

# A co jesli chcemy sprawdzic ile lacznie utworow zagrano?
# Po to mamy metody klasy
class PlayableSong
  def PlayableSong.total_played
    @@plays
  end
end

puts PlayableSong.total_played

# Dodamy stala do klasy
class SongList
  MAX_TIME = 5*60
  
  def SongList.is_too_long?(song)
    return song.duration > MAX_TIME
  end
end

puts SongList.is_too_long?(p_song)

###
# Kontrola dostepu
class MyClass
    # domyslnie mamy 'public'
    def m1
    end
  
  protected
    def m2
    end

  private
    def m3
    end
    
  public
    def m4
    end
end

# to samo, ale inna skladnia
class MC
  def m1
  end
  
  def m2
  end
  
  def m3
  end
  
  public    :m1
  protected :m2
  private   :m3
end