module Keys
    def choose_key
         puts "Choose a Key type"
         puts "a. Major Key"
         puts "b. Minor Key" 
         puts ""
         gets.chomp.downcase.strip
    end
end