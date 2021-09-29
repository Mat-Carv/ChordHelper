require "./views/progressions/new"
require "./models/progression"

class ProgressionsController
    def new
        progression = Progression.new
        Views::Progressions.new progression
        #progression.save
    end
end
