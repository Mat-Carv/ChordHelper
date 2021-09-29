require 'tty-table'
require "./controllers/chord_fetcher"

include ChordFetcher

module Views
    module Progressions
        def self.show(inst)
            headers = %w[Atrribute Value]
            attrs = attribute_rows_for recipe
            table = TTY::Table.new headers, attrs
            puts table.render :ascii
            puts ""
            puts "Chord Diagrams"
            ChordFetcher.fetch_chords inst
        end

        def self.attribute_rows_for(inst)
            rows = []
            rows << ['Key type', inst.key_type]
            rows << ['Root', inst.root]
            rows << ['Intervals', inst.prog]
            rows << ['Chords', inst.chords]
        end
    end
end