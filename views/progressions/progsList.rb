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

    def choose_prog(prog)
        if prog.key == "a"
            #puts MajorProgs
            MajorProgs.each{|key, value|
            puts key.to_s + ". "+ value.to_s
        }
        elsif prog.key == "b"
            #puts MinorProgs
             MinorProgs.each{|key, value|
             puts key.to_s + ". "+ value.to_s
         }
        end
        gets.chomp.strip.to_sym
    end

    def major_progs

    end


end