require "./views/progressions/new"
require "./models/progression"
class ProgressionsController
    def new
        prog = Progression.new
        Views::Progressions.new prog
    end
end
