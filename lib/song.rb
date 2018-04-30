require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    @song = self.new
    @@all << @song
    @song
  end
  
  def self.new_by_name(name)
    @song = self.new
    @song.name = name
    @song
  end
  
  def self.create_by_name(name)
    @song = self.create
    @song.name = name
    @song
  end
  
  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(string)
    if self.find_by_name(string)
      @song
    else
      self.create_by_name(string)
    end
  end
  
  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.new_from_filename(filename)
    array = filename.split(" - ")
    @song.artist_name = array[0]
    song_name_array = array[1].split(".")
    @song.name = song_name_array[0]
    @song
  end
  
  def self.create_from_filename(filename)
    array = filename.split(" - ")
    @song = self.create
    @song.artist_name = array[0]
    song_name_array = array[1].split(".")
    @song.name = song_name_array[0]
    @song
    
  end

end
