require 'tty-table'

module Tables
    def main_menu
        puts "Main Menu"
        puts ""
        headers = %w[OPTIONS COMMANDS]
        attrs = [["New Progression", "n"], 
                 ["List of Progressions", "l"],
                 ["Load a Progression", "s"],
                 ["Delete a Progression", "d"],
                 ["Quit", "q"]]
        table = TTY::Table.new headers, attrs
        puts table.render :ascii
        puts ""
        print "Enter a command: "
    end
end