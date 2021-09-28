require "./views/progressions/keys"
require "./views/progressions/roots"
require "./views/progressions/progsList"

include Keys
include Roots
include ProgsList

module Views
    module Progressions
        def self.new(prog)
            puts "New Chord Progression"
            puts ""
            prog.key_type = Keys.choose_key
            prog.root = Roots.choose_root
            prog.prog = ProgsList.choose_prog prog
        end

    end
end