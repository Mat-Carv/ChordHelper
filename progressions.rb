#!/usr/bin/env ruby

# Router/Dispatch

require "./controllers/progressions_controller"
progs_controller = ProgressionsController.new   

begin
    system("clear")
    print "Enter a command (list, show, new, delete, quit): "
    input = gets.chomp.downcase.strip.split(' ')
    command, param = input

    case command
    # when 'list', 'l'
    #     progs_controller.index
    #     puts "Press enter to return to Menu"
    #     gets
    when 'show', 's'
        progs_controller.show param
        puts "Press enter to return to Menu"
        gets
    when 'new', 'n'
        progs_controller.new
        puts "Press enter to return to Menu"
        gets
    # when 'delete', 'd'
    #     recipes_controller.destroy param
    end
end until ['quit', 'q'].include? command