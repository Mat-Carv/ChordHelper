require_relative "./active_record"
require_relative "./log"

class Progression < ActiveRecord
    include Log

    attr_reader :key_type, :root, :prog, :chords, :id

    def initialize(key_type: "", root: "", prog: "")
        self.key_type = key_type
        self.root = root
        self.prog = prog
        puts "oh hi mark"
    end

    def key_type=(key_type)
        @key_type = key_type
        puts "Key Type"
        puts @key_type
    end

    def root=(root)
        @root = root
        puts "Root"
        p @root
    end

    def prog=(prog)
        @prog = prog
        puts "Progression"
        p @prog
    end

    def chords=(chords)
        @chords = chords
        puts "Notes in the key"
        p @chords
    end

    def major_or_minor
        if @key_type == "a"
            return "Major"
        elsif @key_type == "b"
            return "Minor"
        end
    end
    
    def save
        super
        log "Persisted Progression:#{@id}"
    end

end