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
        def self.change_prog(inst)
            inst.prog = ProgsList.choose_prog inst
            inst.chords = Notes.define_notes inst
        end

    end
end