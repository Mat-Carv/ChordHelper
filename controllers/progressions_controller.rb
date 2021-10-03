require "./views/progressions/new"
require "./views/progressions/index"
require "./views/progressions/show"
require "./views/progressions/change_prog"
require "./models/progression"

class ProgressionsController
    
    def new
        progression = Progression.new
        Views::Progressions.new progression
        Views::Progressions.show progression
    end

    def index
        progressions = Progression.all.compact
        Views::Progressions.index progressions
    end

    def show
        progression = Progression.find
        if progression != nil
            Views::Progressions.show progression
        end
    end

    def destroy      
        progression = Progression.find
        if progression != nil
            progression.destroy progression
        end
        
    end

end
