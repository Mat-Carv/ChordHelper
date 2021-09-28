require "./views/progressions/roots"

include Roots

class Progression
    attr_reader :key_type, :root, :prog

    def initialize(key_type: "", root: "", prog: "")
        @valid = false
        self.key_type = key_type
        self.root = root
        self.prog = prog
    end

    def key_type=(key_type)
        @key_type = key_type
        @valid = @key_type == "a" || @key_type == "b"
        puts @key_type
    end

    def key
         @key_type
    end

    def root=(root)
        @root = root
        @valid = RootArr.include? root
        puts @root
    end

    def prog=(prog)
        @prog = prog
        p @prog
        puts @key_type
        if @key_type == "a"
            @valid = MajorProgs.key?(prog)
        elsif @key_type == "b"
            @valid = MinorProgs.key?(prog)
        end
    end
end