class InvalidType < StandardError; end
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

    def job
      @jobs.dup.freeze
    end

    def add_job(job)
      if !job.is_a?(RemoteJobSearch::Job)
        raise InvalidType, "must be a Job"
      else
      @jobs << job
    end
  end
binding.pry
end
