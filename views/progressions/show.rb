require 'tty-table'
require "./controllers/chord_fetcher"
require "./views/progressions/change_root"
require "./views/progressions/change_prog"

include ChordFetcher
include Views::Progressions

module Views
    module Progressions

        def self.show(inst)
            system("clear")
            self.display inst 
            self.menu_show inst
        end

        def self.display(inst)
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
            rows << ['Intervals', inst.prog]
            rows << ['Chords', inst.chords]
        end

        def self.menu_show(inst)
            begin #keeps adding lines unless e or q, fix later
                puts "- To Edit Progression, type 'e'"
                puts "- To Quit, type 'q'"
                input = gets.chomp.downcase.strip.split(' ')
                command, param = input
              
                case command 
                when "edit", "e"
                    self.change inst
                when "save", "s"
                    #add save option
                end

                #find a way to loop the show/menu
            end until ['quit', 'q'].include? command
            # Or add save option here
        end

        def self.change(inst)
            begin
                # system("clear")
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
    end
end