

class Progression
    attr_reader :key_type, :root, :prog, :chords

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
end