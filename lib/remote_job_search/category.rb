class RemoteJobSearch::Category

#expectation: a class that creates category instances that belong to jobs
# want categories to know about jobs and jobs to know about thier categories
# Categories have many jobs, a job has one category

attr_accessor :name, :jobs

@@all = []

  def initialize(name, jobs_array)
    @name = name
    @jobs = jobs_array.collect do |job_details|
      Job.new(self, job_attributes)
    end

    @@all << self
  end

  def self.all
    @@all
  end

  def self.print_all
    all.each.with_index(1) do |category, i|
      puts "#{i}. #{category.name}"
    end
  end
end
