class RemoteJobSearch::Job

  attr_accessor :title, :company, :date, :url, :category

  @@all = []

  def initialize(category = nil, job_hash)
    @category = category
    job_hash.each do |job_key, job_value|
      self.send(("#{job_key}="), job_value)
    end
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create_from_scrape(category = nil, design_job_hash)
    design_job_hash.each do |job|
      RemoteJobSearch::Job.new(job)
    end
  end

  def category=(category)
    @category = category
    category.add_job(self) unless category.jobs.include?(self)
  end
  # binding.pry

#   def initialize(job_hash)
#     job_hash.each {|key, value| self.send(("#{key}="), value)}
#     @all << self
#   end
#
#   # def self.all
#   #   @@all
#   # end
#   #
#   # def self.category
#   #   self.scrape_categories
#   # end
#   #
#   # def self.scrape_categories
#   #   #go to weworkremotely and scrape categories
#   #   #return value = array of job categories
#   #   job_categories = []
#   #   job_categories << self.scrape_wework
#   #   job_categories
#   # end
#
end
