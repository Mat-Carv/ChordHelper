require_relative "./active_record"
require_relative "./log"

class Progression < ActiveRecord
    include Log

    attr_reader :key_type, :root, :prog, :chords, :id

    def initialize(key_type: "", root: "", prog: "")
        self.key_type = key_type
        self.root = root
        self.prog = prog
    end

    def key_type=(key_type)
        @key_type = key_type
    end

    def root=(root)
        @root = root
    end

    def prog=(prog)
        @prog = prog
    end

    def chords=(chords)
        @chords = chords
    end

    def major_or_minor
        if @key_type == "a"
            return " major"
        elsif @key_type == "b"
            return " minor"
        end
    end
    
    def save
        super
        log "Persisted Progression:#{@id}"
    end

end