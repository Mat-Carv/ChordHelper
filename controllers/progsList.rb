require "./models/progression"
require "./controllers/progressions_controller"

module ProgsList

    MajorProgs = {a: ["I", "V", "vi", "IV"], 
                  b: ["V", "vi", "IV", "I"],
                  c: ["vi", "IV", "I", "V"],
                  d: ["I", "ii", "iii", "IV", "V", "vi", "vii"]}

    MinorProgs = {a: ["i", "VI", "III", "VII"], 
                  b: ["VI", "VII", "i" , "i" ],
                  c: ["i", "VII", "VI", "VII"],
                  d: ["i", "ii", "III", "iv", "v", "VI", "VII"]}

    def choose_prog(inst)
        if inst.key_type == "a"
                self.major_option
        elsif inst.key_type == "b"
                self.minor_option               
        end
    end

    def major_option
        loop do
            #system("clear")
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
            #system("clear")
            puts "oh hi jonas"
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