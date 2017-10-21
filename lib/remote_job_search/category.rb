class RemoteJobSearch::Category

  attr_accessor :category_name, :jobs

  @@all = []

  def initialize(category_name, jobs)
    @category_name = category_name
    @jobs = jobs.map do |job_attributes|
      RemoteJobSearch::Job.new(self, job_attributes)
    end
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(input)
    @@all[input.to_i-1]
  end

  def save
    if !@@all.include?(self)
      @@all << self
    end
  end
end
