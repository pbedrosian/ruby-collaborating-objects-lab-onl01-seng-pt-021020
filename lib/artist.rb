class Artist
  attr_accessor :name, :songs #setter/getter for name
  @@all = [] #sets empty array to hold date
  def initialize(name) #appon initilization, the instance takes in the name
    @name = name
    save #calls the save method
    @songs = []
  end
  def save #save takes the instance and adds it to the array @@all
    @@all << self
  end
  def self.all #the all method returns the filled array of all artists
    @@all
  end
  def add_song(song)
     @songs << song
  end
  def self.find_or_create_by_name(name)   #class method uses find/create class
                                          #methods to detect or create instances
    if self.find(name)
      self.find(name)
    else
      self.create(name)
    end
  end
  def self.find(name)     #class method detects instances from @@all class variable
    self.all.detect { |artist| artist.name == name }
  end
  def self.create(name)   #class method creates & stores instances vs initializing
    artist = Artist.new(name)
    artist.save
    artist
  end
  def print_songs
    @@all.each {|song| song.name}
  end
end
