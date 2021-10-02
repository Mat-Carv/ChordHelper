require "./models/progression"

module Notes
    
    NotesArr = ["A","A#","B","C","C#","D","D#","E","F","F#","G","G#","A","A#","B","C","C#","D","D#","E","F","F#","G"]
    
    def choose_root
        loop do
            #system("clear")
            puts "Choose a Root Note: "
            puts ""
            puts ["A","A#","B","C","C#","D","D#","E","F","F#","G","G#"].to_s
            puts ""
            input = gets.chomp.upcase.strip

            if NotesArr.include? input
                return input
                break
            else
                puts "Invalid Option"
                gets
            end
        end
    end

    def define_notes(inst)
        i = 0
        
        chords = []

        case inst.root
        when "A"
            i = 0
        when "A#"
            i = 1
        when "B"
            i = 2
        when "C"
            i = 3
        when "C#"
            i = 4
        when "D"
            i = 5
        when "D#"
            i = 6
        when "E"
            i = 7
        when "F"
            i = 8
        when "F#"
            i = 9
        when "G"
            i = 10
        when "G#"
            i = 11
        end

        if inst.key_type == "a"

            maj_int = {"I"=>[NotesArr[i]], "ii"=>[NotesArr[i+2], "m"], "iii"=>[NotesArr[i+4], "m"], "IV"=>[NotesArr[i+5]], "V"=>[NotesArr[i+7]], "vi"=>[NotesArr[i+9], "m"], "vii"=>[NotesArr[i+11], "m"]}
            
            inst.prog.each{|int|
                if maj_int[int][1]   
                    chords << maj_int[int][0] + maj_int[int][1]
                else
                    chords << maj_int[int][0]
                end
            }             
            return chords
            
        elsif inst.key_type == "b"
            
            min_int = {"i"=>[NotesArr[i], "m"], "ii"=>[NotesArr[i+2], "m"], "III"=>[NotesArr[i+3]], "iv"=>[NotesArr[i+5], "m"], "v"=>[NotesArr[i+7], "m"], "VI"=>[NotesArr[i+8]], "VII"=>[NotesArr[i+10]]}             
        
            inst.prog.each{|int|
                if min_int[int][1]   
                    chords << min_int[int][0] + min_int[int][1]
                else
                    chords << min_int[int][0]
                end
            }             
            return chords
        end
    end

end