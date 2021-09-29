require "./views/progressions/keys"
require "./views/progressions/notes"
require "./views/progressions/progsList"

include Keys
include Notes
include ProgsList

module Views
    module Progressions
        def self.new(inst)
            system("clear")
            puts "New Chord Progression"
            puts ""
            inst.key_type = Keys.choose_key
            inst.root = Notes.choose_root
            inst.prog = ProgsList.choose_prog inst
            puts Notes.define_notes inst
        end

    end
end