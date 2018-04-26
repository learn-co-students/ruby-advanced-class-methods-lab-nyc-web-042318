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

  def self.new_by_name(song_name, artist_name=nil)
    @song = self.new
    @song.artist_name = artist_name
    @song.name = song_name
    @song
  end

  def self.create_by_name(song_name, artist_name=nil)
    @song = self.create
    @song.name = song_name
    @song.artist_name = artist_name
    @song
  end

  def self.find_by_name(song_name)
    self.all.detect do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      @song
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end

  def self.new_from_filename(song_file)
    song_name_array=song_file.split(" - ")
    self.new_by_name(song_name_array[1][0...-4])
    @song.artist_name= song_name_array[0]
    @song
  end

  def self.create_from_filename(song_file)
    song_name_array=song_file.split(' - ')
    self.create_by_name(song_name_array[1][0...-4])
    @song.artist_name= song_name_array[0]
    @song
  end

  def self.destroy_all
    self.all.clear
  end
end
