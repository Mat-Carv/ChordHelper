require "./controllers/keys"
require "./controllers/notes"
require "./controllers/progsList"
require "./controllers/chord_fetcher"

include Keys
include Notes
include ProgsList
include ChordFetcher

module Views
    module Progressions
        def self.new(inst)
            system("clear")
            puts "New Chord Progression"
            puts ""

            inst.key_type = Keys.choose_key
            inst.prog = ProgsList.choose_prog inst
            inst.root = Notes.choose_root
            inst.chords = Notes.define_notes inst
            
            puts "Chord Diagrams"
            ChordFetcher.fetch_chords inst
        end

    end
end