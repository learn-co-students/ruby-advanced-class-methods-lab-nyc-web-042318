require "pry"

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
    self.all << self.new
    self.all.last
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    self.all << self.new_by_name(name)
    self.all.last
  end

  def self.find_by_name(name)
    self.all.find do |song_obj|
      song_obj.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    alphabetical_array = []
    self.all.sort_by! do |song_obj|
      song_obj.name
    end
    self.all
  end

  def self.new_from_filename(file_name)
    song = self.new
    song.artist_name = file_name.split(".").first.split(" - ").first
    song.name = file_name.split(".").first.split(" - ").last
    song
  end

  def self.create_from_filename(file_name)
    self.all << self.new_from_filename(file_name)
    self.all.last
  end

  def self.destroy_all
    self.all.clear
  end

end
