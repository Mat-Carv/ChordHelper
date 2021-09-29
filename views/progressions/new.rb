require "./views/progressions/keys"
require "./views/progressions/roots"
require "./views/progressions/progsList"

include Keys
include Roots
include ProgsList

module Views
    module Progressions
        def self.new(progression)
            puts "New Chord Progression"
            puts ""
            progression.key_type = Keys.choose_key
            progression.root = Roots.choose_root
            progression.prog = ProgsList.choose_prog progression

            #call method that will display chords
        end

    end
end