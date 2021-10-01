require 'tty-table'
require "./controllers/chord_fetcher"
require "./views/progressions/change_root"
require "./views/progressions/change_prog"

include ChordFetcher
include Views::Progressions

module Views
    module Progressions
        def self.change(inst)
            begin
                system("clear")
                print "Change (Root, Progression): "
                input = gets.chomp.downcase.strip.split(' ')
                command, param = input
            
                case command
                when 'root', 'r'
                    Views::Progressions.change_root inst
                    puts "Press enter to return to Menu"
                    gets
                when 'progression', 'p'
                    Views::Progressions.change_prog inst
                    puts "Press enter to return to Menu"
                    gets
                end
            end until ['quit', 'q'].include? command
        end

        def self.show(inst)
            system("clear")
            headers = %w[Components Details]
            attrs = attribute_rows_for inst
            table = TTY::Table.new headers, attrs
            puts table.render :ascii
            puts ""
            puts "Chord Diagrams"
            ChordFetcher.fetch_chords inst
            self.change(inst)
        end

        def self.attribute_rows_for(inst)
            rows = []
            rows << ['Key', inst.root + inst.major_or_minor]
            rows << ['Intervals', inst.prog]
            rows << ['Chords', inst.chords]
        end

    end
end