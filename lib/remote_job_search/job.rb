class RemoteJobSearch::Job
attr_accessor :category

  def self.category
    self.scrape_categories
  end

  def self.scrape_categories
    #go to workingnomads and scrape categories
    jobs = []
    doc = Nokogiri::HTML(open("https://www.workingnomads.co/jobs"))
    binding.pry

    jobs
  end
end
