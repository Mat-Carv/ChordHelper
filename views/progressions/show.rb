require 'tty-table'
require "./controllers/chord_fetcher"
require "./views/progressions/change_root"
require "./views/progressions/change_prog"
require "./models/progression"
require "./views/tables/tables.rb"

include ChordFetcher
include Views::Progressions
include Tables

module Views
    module Progressions

        def self.show(inst)
            system("clear")
            self.display inst 
            self.menu_show inst
        end

        def self.display(inst)
            puts "Chord Progression"
            headers = %w[Components Details]
            attrs = attribute_rows_for inst
            table = TTY::Table.new headers, attrs
            puts table.render :ascii
            puts ""
            puts "Chord Diagrams"
            ChordFetcher.fetch_chords inst
            puts ""
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
              
                 
                if command == "edit" || command == "e"
                    self.change inst
                    break
                end

                #find a way to loop the show/menu
            end until ['quit', 'q'].include? command
            self.save_prompt inst
        end

        def self.save_prompt(inst)
            l = true
            while l == true
                system("clear")
                puts "Save Changes? (y/n)"
                input =  gets.chomp.downcase.strip

                if input == "y"
                    inst.save
                    l = false
                elsif input == "n"
                    l = false
                end
            end
        end

        def self.change(inst)
            begin
                system("clear")
                
                self.display inst
                Tables.edit_menu
                input = gets.chomp.downcase.strip.split(' ')
                command, param = input
            
                case command
                when 'root', 'r'
                    Views::Progressions.change_root inst
                when 'progression', 'p'
                    Views::Progressions.change_prog inst
                end
            end until ['quit', 'q'].include? command
        end
    end
end