

require "./controllers/progressions_controller"
progs_controller = ProgressionsController.new   

begin
    system("clear")
    print "Enter a command (list, show, new, delete, quit): "
    input = gets.chomp.downcase.strip.split(' ')
    command, param = input

    case command
    # when 'list', 'l'
    #     recipes_controller.index
    #when 'show', 's'
    #   progs_controller.show param
    when 'new', 'n'
        progs_controller.new
        puts "Press enter to return to Menu"
        gets
    # when 'delete', 'd'
    #     recipes_controller.destroy param
    end
end until ['quit', 'q'].include? command