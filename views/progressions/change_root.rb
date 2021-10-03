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
        def change_root(inst)
            inst.root = Notes.choose_root
            inst.chords = Notes.define_notes inst    
        end

    end
end