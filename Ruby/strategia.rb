#! ruby -w

# Probujemy przetrenowac wykorzystanie wzorca projektowego STRATEGIA.
# Pozwala on na zdefiniowanie rodziny algorytmow i pozwala je wymieniac w zaleznosci od potrzeb.

# Makieta bedzie taka: mamy obiekty multimedialne i chcemy moc je odtwarzac.
# Jednak rozne typu obiektow potrzebuja roznych programow, zeby je uruchomic.

## Abstrakcyjna klasa dla multimediow
class Media
    attr_reader :player, :name

	def initialize(name, player_object)
		@name = name
		set_player player_object
	end
    
    def set_player(player_object)
        @player = player_object
        @player.media = self unless @player.nil?
    end

	def perform_play
		player.play
	end
	
	def display_info
	end
	
end

## Przykladowe klasy pochodne
class Wideo < Media
    def initialize(name, player_object)
        super(name, player_object)
    end
    
	def display_info
        super
		puts "Wideo: #@name"
	end
end

class Music < Media
	def display_info
        super
		puts "Music: #@name"
	end
end

### Hierarchia "algorytmow"
class Algorithm
	attr_reader :media
	attr_writer :media
	
	def play
		raise Exception, " nie wiem co mam grac - brak media" if media.nil?
	end
end

class WideoPlayer < Algorithm
	def play
		super
		puts "Odpalam program do odtwarzania wideo na rzecz #{ media.name }"
	end
end

class MusicPlayer < Algorithm
	def play
		super
		puts "Odpalam program do odtwarzania muzyki na rzecz #{ media.name }"
	end
end

### Teraz wszystko bedziemy laczyc

w = Wideo.new( "Test", nil)

wideo = Wideo.new( "Z kamera wsrod zwierzat", WideoPlayer.new )
music = Music.new( "The best of Chopin", MusicPlayer.new )

wideo.display_info
music.display_info

wideo.perform_play
music.perform_play

### A teraz dodamy nowe ficzery i pokazemy, ze nie bedzie to wymagalo grzebania
class Photo < Media
    def display_info
        puts "Photo: #@name"
    end
end

class PhotoViewer < Algorithm
    def play
        super
        puts "Odpalam przeglarke obrazkow na rzecz #{ media.name }"
    end
end

photo = Photo.new( "Wakacje na bezludnej wyspie", PhotoViewer.new )

photo.display_info
photo.perform_play

arr = [wideo, music, photo]
arr.each { |media| media.perform_play }