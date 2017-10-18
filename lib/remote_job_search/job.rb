class RemoteJobSearch::Job

  attr_accessor :title, :company, :date, :url, :details, :apply_link, :category

    @@all = []



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
