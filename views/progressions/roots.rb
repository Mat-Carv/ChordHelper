module Roots
    
    RootArr = ["A","A#","B","C","C#","D","D#","E","F","F#","G","G#","A","A#","B","C","C#","D","D#","E","F","F#","G"]
    
    def choose_root
        loop do
            system("clear")
            puts "Choose a Root Note: "
            puts ""
            puts RootArr.to_s
            puts ""
            input = gets.chomp.upcase.strip

            if RootArr.include? input
                return input
                break
            else
                puts "Invalid Option"
                gets
            end
        end
    end
end