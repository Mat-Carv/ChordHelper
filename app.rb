#This file was made with the intent of testing some intended functionalities of the app on a very basic level, in order to help in the planning process.  

# "prog" holds all notes. It will be used in conjunction with "i", and the choice between Major and Minor key to define the notes of each key
# The notes repeat after G#. This was done in order to support the functionality of "i".
prog = ["A","A#","B","C","C#","D","D#","E","F","F#","G","G#","A","A#","B","C","C#","D","D#","E","F","F#","G"]

# progression options will be separated between Major and Minor, which will be chosen by the user. Only progressions valid to the users choice will be displayed.
# this hash was made as a means of testing functionality.
progressions = {a: ["I", "V", "vi", "IV"], 
                b: ["V", "vi", "IV", "I"],
                c: ["vi", "IV", "I", "V"],
                d: ["I", "ii", "iii", "IV", "V", "vi", "vii"]}

# displays progression options neatly
progressions.each{|key, value|
    puts key.to_s + ". "+ value.to_s
}
puts ""
puts "Choose a Progression"
pr = gets.chomp
puts ""
puts "Choose a Key"
root = gets.downcase.chomp

i = 0
arr = []
arr1 =[]

# "i" will define the root note, or in othe words, the first note of the chosen key. Based on which note the user chooses as the root "i" will be set to its corresponding position in prog.
case root
when "a"
    i = 0
when "a#"
    i = 1
when "b"
    i = 2
when "c"
    i = 3
when "c#"
    i = 4
when "d"
    i = 5
when "d#"
    i = 6
when "e"
    i = 7
when "f"
    i = 8
when "f#"
    i = 9
when "g"
    i = 10
when "g#"
    i = 11
end

# The notes of each key are defined by interval distance (number of semitones), which depends on the key being Major or Minor. The interval distances that define each type of key is constant, and could be counted as the number of "steps" on the piano. As an example, the third interval of a Major key(iii) will always be 4 "steps"(semitones) ahead of the fisrt note(root).

# "maj_int" and "min_int" define the Major and Minor key note intervals
maj_int = {"I"=>[prog[i]], "ii"=>[prog[i+2], "m"], "iii"=>[prog[i+4], "m"], "IV"=>[prog[i+5]], "V"=>[prog[i+7]], "vi"=>[prog[i+9], "m"], "vii"=>[prog[i+11], "m"]}

min_int = {"i"=>prog[i], "ii"=>prog[i+2], "III"=>prog[i+3], "iv"=>prog[i+5], "v"=>prog[i+7], "VI"=>prog[i+8], "VII"=>prog[i+10]}

# "arr1" will show the user their chosen progression
arr1 << progressions[pr.to_sym]

# "arr" will show the user the correspondent root notes to their chosen key + progression
progressions[pr.to_sym].each{|int|
    if maj_int[int][1]   
        arr << maj_int[int][0] + maj_int[int][1]
    else
        arr << maj_int[int][0]
    end
}

puts ""
puts "Root Notes"
puts maj_int
puts ""
puts min_int
puts ""
p arr1
p arr

TEMPLATE = ["  _V__1st Fret ______",
            "e|---|---|---|---|---|",
            "B|---|---|---|---|---|",
            "G|---|---|---|---|---|",
            "D|---|---|---|---|---|",
            "A|---|---|---|---|---|",
            "E|---|---|---|---|---|",]

g = ["CHORD NAME",
     "",
     "  _V__1st Fret ______",
     "e|---|---|[3]|---|---|",
     "B|---|---|---|---|---|",
     "G|---|---|---|---|---|",
     "D|---|---|---|---|---|",
     "A|---|[1]|---|---|---|",
     "E|---|---|[2]|---|---|",]

puts ""
puts g