require "./views/progressions/new"
require "./views/progressions/index"
require "./views/progressions/show"
require "./views/progressions/change_prog"
#require "./models/active_record"
require "./models/progression"

class ProgressionsController
    
    def new
        progression = Progression.new
        Views::Progressions.new progression
        progression.save
        Views::Progressions.show progression
    end

    def index
        progressions = Progression.all.compact
        Views::Progressions.index progressions
    end

    def show
        progression = Progression.find
        Views::Progressions.show progression
        progression.save
    end

    def destroy      
        progression = Progression.find
        progression.destroy progression
    end

end
