class RemoteJobSearch::Scraper

  def self.scrape_index_page
    doc = Nokogiri::HTML(open("https://weworkremotely.com"))

    jobs = []

    doc.css("article").each do |job|
      hash = {
        :category => job.css("h2 a").text,
        :status => job.css("ul li span.new").text,
        :company => job.css("ul li a span.company").text,
        :title => job.css("ul li a span.title").text,
        :date => job.css("ul li a span.date").text
      }
      jobs << hash
    end
    jobs
  end
end
