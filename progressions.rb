#!/usr/bin/env ruby

# Router/Dispatch
require "./views/tables/tables.rb"
require "./controllers/progressions_controller"

include Tables

progs_controller = ProgressionsController.new   

begin
    system("clear")
    Tables.main_menu
    input = gets.chomp.downcase.strip

    case input
        
    when 'list', 'l'
        progs_controller.index
        puts "Press enter to return to Menu"
        gets

    when 'show', 's'
        progs_controller.index
        progs_controller.show
        system("ruby progressions.rb")
        break

    when 'new', 'n'
        progs_controller.new

    when 'delete', 'd'
        progs_controller.index
        progs_controller.destroy

    end
end until ['quit', 'q'].include? input
