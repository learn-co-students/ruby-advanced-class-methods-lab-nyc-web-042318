require 'pry'
class Song

  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    # song = self.new
    # song.name = name
    # @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect do  |x|
       x.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |x|
    x.name
    end
  end

  def self.new_from_filename(filename)
    x = filename.split(" - ")
    x[1].slice!(".mp3")

    artists_name = x[0]
    song_title = x[1]

    song = self.find_or_create_by_name(song_title)
    song.artist_name = artists_name
    song

  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end
