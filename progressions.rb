#!/usr/bin/env ruby

# Router/Dispatch
require "./views/tables/tables.rb"
require "./controllers/progressions_controller"

include Tables

progs_controller = ProgressionsController.new   

begin
    system("clear")
    Tables.main_menu
    input = gets.chomp.downcase.strip.split(' ')
    command, param = input

    case command
    when 'list', 'l'
        progs_controller.index
        puts "Press enter to return to Menu"
        gets
    when 'show', 's'
        progs_controller.index
        progs_controller.show
        puts "Press enter to return to Menu"
        gets
    when 'new', 'n'
        progs_controller.new
        puts "Press enter to return to Menu"
        gets
    when 'delete', 'd'
        progs_controller.index
        progs_controller.destroy
    end
end until ['quit', 'q'].include? command