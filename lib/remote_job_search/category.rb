class RemoteJobSearch::Category

#expectation: a class that creates category instances that belong to jobs
# want categories to know about jobs and jobs to know about thier categories
# Categories have many jobs, a job has one category

attr_accessor :name, :jobs

    @@all = []

    def initialize(name)
      @name = name
      @jobs = []
      @@all << self
    end

    def self.all
      @@all
    end


# binding.pry
end
