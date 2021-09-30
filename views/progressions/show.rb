require 'tty-table'
require "./controllers/chord_fetcher"

include ChordFetcher

module Views
    module Progressions
        def self.show(inst)
            system("clear")
            headers = %w[Components Details]
            attrs = attribute_rows_for inst
            table = TTY::Table.new headers, attrs
            puts table.render :ascii
            puts ""
            puts "Chord Diagrams"
            ChordFetcher.fetch_chords inst
        end

        def self.attribute_rows_for(inst)
            rows = []
            rows << ['Key', inst.root + inst.major_or_minor]
            # rows << ['Root', ]
            rows << ['Intervals', inst.prog]
            rows << ['Chords', inst.chords]
        end
    end
end