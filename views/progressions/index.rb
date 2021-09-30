require 'tty-table'

module Views
    module Progressions
        def self.index(list)
            system("clear")
            
            return puts "No Progressions Found" if list.empty?

            puts "Chord Progressions"

            headers = %w[ID Key Progression Chords]
            rows = table_rows_for list
            table = TTY::Table.new headers, rows
            puts table.render(:ascii)
        end

        def self.table_rows_for(list)
            list.map do |inst|
                [inst.id, inst.root + inst.major_or_minor, inst.prog, inst.chords]
            end
        end

    end
end