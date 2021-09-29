require "./models/progression"
require "./chords.rb"

include Chords

module ChordFetcher
    def fetch_chords(inst)
        display = []

        # Converts the chord names to their respective Symbols in chords.rb 
        inst.chords.map{|x|
            display << Chords::CHORDS[x.gsub("#", "s").to_sym]
        }

        puts ""

        x = 0

        # Prints the  diagrams line by line, in order to have them display vertically
        while x < 10
            display.each{|chord|
                print "   " + chord[x].to_s
            }
            puts " "
            x += 1
        end
    end
end