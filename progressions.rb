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
        display_index = progs_controller.index
        
        if display_index != nil
            puts "Press Enter to continue."
            gets
        end

    when 'show', 's'
        begin
            display_index = progs_controller.index

            if display_index != nil
                progs_controller.show 
                system("ruby progressions.rb")
                break
            end

        rescue StandardError
            puts "ID not found! Press Enter to continue."
            gets
        retry

        end

    when 'new', 'n'
        progs_controller.new

    when 'delete', 'd'
        begin
            display_index = progs_controller.index

            if display_index != nil
                progs_controller.destroy
                system("ruby progressions.rb")
                break
            end
               
        rescue StandardError
            puts "ID not found! Press Enter to continue."
            gets
        retry

        end

    end

    rescue StandardError
        puts "An Error Ocurred"
        gets
    retry

end until ['quit', 'q'].include? input
