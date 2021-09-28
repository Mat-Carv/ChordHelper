module Roots
    
    RootArr = ["A","A#","B","C","C#","D","D#","E","F","F#","G","G#","A","A#","B","C","C#","D","D#","E","F","F#","G"]
    
    def choose_root
        puts "Choose a Key from the following: " + RootArr.to_s
        puts ""
        gets.chomp.strip
    end
end