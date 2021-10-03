require "./models/progression"
require "./controllers/progressions_controller"

module ProgsList

    MajorProgs = {a: ["I", "V", "vi", "IV"], 
                  b: ["V", "vi", "IV", "I"],
                  c: ["vi", "IV", "I", "V"],
                  d: ["I", "vi", "IV", "V"],
                  e: ["I", "vi", "ii", "V"],
                  f: ["I", "IV", "ii", "V"],
                  g: ["ii", "V", "I", "I"],
                  h: ["I", "ii", "iii", "IV", "V", "vi", "vii"]}

    MinorProgs = {a: ["i", "VI", "III", "VII"], 
                  b: ["VI", "VII", "i" , "i" ],
                  c: ["i", "VII", "VI", "VII"],
                  d: ["i", "III", "VII", "VI"],
                  e: ["i", "VI", "iv", "VII"],
                  f: ["i", "v", "iv", "VII"],
                  g: ["i", "v", "VII", "iv"],
                  h: ["i", "ii", "III", "iv", "v", "VI", "VII"]}

    def choose_prog(inst)
        puts "Choose a Progression"
        if inst.key_type == "a"
                self.major_option
        elsif inst.key_type == "b"
                self.minor_option               
        end
    end

    def major_option
        loop do
            MajorProgs.each{|key, value|
            puts key.to_s + ". "+ value.to_s}

            input = gets.chomp.strip.to_sym

            if MajorProgs.include? input
                return MajorProgs[input]
                break
            else
                puts "Invalid Option"
                gets
            end
        end
    end

    def minor_option
        loop do
            MinorProgs.each{|key, value|
            puts key.to_s + ". "+ value.to_s}
            
            input = gets.chomp.strip.to_sym

            if MinorProgs.include? input
                return MinorProgs[input]
                break
            else
                puts "Invalid Option"
                gets
            end
        end
    end

end