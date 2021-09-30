require "./views/progressions/new"
require "./views/progressions/index"
require "./views/progressions/show"
#require "./models/active_record"
require "./models/progression"

class ProgressionsController
    
    def new
        progression = Progression.new
        Views::Progressions.new progression
        progression.save
    end

    def show
        print "Select Progression: "
        id = gets.chomp.downcase.strip
        progression = Progression.find(id)
        Views::Progressions.show progression
    end

    def index
        progressions = Progression.all.compact
        Views::Progressions.index(progressions)
    end

    def destroy(id)
        progression = Progression.find(id)
        progression.destroy
    end

end
