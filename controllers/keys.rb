module Keys
    def choose_key
        loop do
            #system("clear")
            puts "Choose a Key type"
            puts "a. Major Key"
            puts "b. Minor Key" 
            puts ""

        input = gets.chomp.downcase.strip
            
            if input == "a" || input == "b"
                return input
                break
            else
                puts "Invalid Option"
                gets
            end
        end
    end
end