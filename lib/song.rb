class Song
  attr_accessor :artist, :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def self.new_by_filename(title)
    songs = title.split(" - ")[1]
    artist = title.split(" - ")[0]
    song = self.new(songs)
    song.artist_name = artist
    song
  end

  def self.all
    @@all
  end

end
