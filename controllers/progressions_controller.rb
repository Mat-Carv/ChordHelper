require "./views/progressions/new"
require "./views/progressions/show"
require "./models/progression"

class ProgressionsController
    def new
        progression = Progression.new
        Views::Progressions.new progression
        progression.save
    end

    def show(id)
        progression = Progression.find(id)
        Views::Progressions.show progression
    end

end
