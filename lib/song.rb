class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = "",art_name = "")
    @name = name
    @artist_name = art_name
    @@all << self
  end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    return self.new
  end

  def self.new_by_name(name)
    return self.new(name)

  end

  def self.create_by_name(name)
    return self.new(name)
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    return nil
  end


  def self.find_or_create_by_name(name)
    result = self.find_by_name(name)
    if result == nil
      result = self.create_by_name(name)
    end
    result
  end

  def self.alphabetical()
    @@all.sort do |x,y|
      x.name <=> y.name
    end
  end


  def self.new_from_filename(filename)
    filename = filename.rstrip
    filename = filename[0,filename.index(".")]
    temp = filename.split(" - ")

    self.new(temp[1],temp[0])

  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)

  end

  def self.destroy_all
    while !@@all.empty?
      @@all.pop
    end

  end



end
