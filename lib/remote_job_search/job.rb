class RemoteJobSearch::Job
attr_accessor :category

  def self.category
    self.scrape_categories
  end

  def self.scrape_categories
    #go to weworkremotely and scrape categories
    #return value = array of job categories
    job_categories = []
    job_categories << self.scrape_wework
    job_categories
  end

  def self.scrape_wework
    doc = Nokogiri::HTML(open("https://weworkremotely.com/"))
    job = self.new
    job.category = doc.css("h2 a").first.text
    job
  end
end
