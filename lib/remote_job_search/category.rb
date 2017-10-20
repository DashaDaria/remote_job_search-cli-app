class RemoteJobSearch::Category

  attr_accessor :name, :jobs

  @@all = []

  def initialize(jobs_attributes_array)
    @name = name
    @jobs = jobs_array.map do |job_attributes|
      RemoteJobSearch::Job.new(self, job_attributes)
    end
    @@all << self
  end

  def self.all
    @@all
  end

end


# #expectation: a class that creates category instances that belong to jobs
# # want categories to know about jobs and jobs to know about thier categories
# # Categories have many jobs, a job has one category
#
# attr_accessor :name, :jobs
#
#     @@all = []
#
#     def initialize(name)
#       @name = name
#       @jobs = []
#       @@all << self
#     end
#
#     def self.all
#       @@all
#     end
#
#     def add_job(job)
#       @jobs << job
#       job.category = self unless job.category == self
#     end
# binding.pry
#
#
#
# # binding.pry
# end
