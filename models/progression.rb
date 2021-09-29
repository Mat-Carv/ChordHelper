

class Progression
    attr_reader :key_type, :root, :prog

    def initialize(key_type: "", root: "", prog: "")
        self.key_type = key_type
        self.root = root
        self.prog = prog
        puts "oh hi mark"
    end

    def key_type=(key_type)
        @key_type = key_type
        puts @key_type
    end

    def root=(root)
        @root = root
        puts @root
    end

    def prog=(prog)
        @prog = prog
        p @prog
    end

end