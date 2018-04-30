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
    new_song = self.new
    @@all << new_song
    new_song
  end


  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.detect do |i|
      i.name == name
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
    self.all.sort_by do |i|
      i.name
    end
  end

  def self.new_from_filename(name)
    split_name = name.split(" - ")
    artist_name_input = split_name[0]
    split_name[1].slice!(".mp3")
    song_title = split_name[1]

    new_song = self.find_or_create_by_name(song_title)
    new_song.artist_name = artist_name_input
    new_song

  end

  def self.create_from_filename(name)
    new_song = self.new_from_filename(name)
    new_song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
