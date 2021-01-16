class Genre
    attr_accessor :name

    @@all = []
    
    def initialize(name)
        @name = name

        @@all.push(self)
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|songs| songs.genre == self}
    end

    def artists
        Song.all.select {|songs| 
            songs.genre == self}.map {|song_instances| 
                song_instances.artist} 
    end
end
