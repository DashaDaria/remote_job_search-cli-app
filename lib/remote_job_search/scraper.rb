class RemoteJobSearch::Scraper

  def self.job_scrape
    programming = Nokogiri::HTML(open("https://weworkremotely.com"))

    programming.css("section.jobs").each do |category|
      @category_name = category.css("h2 a").text.strip.chomp(" Jobs")
      @jobs          = []

      category.css("ul li").each do |attributes|
        jobs = {
          :title => attributes.css("a span.title").text,
          :company => attributes.css("a span.company").text,
          :date => attributes.css("a span.date").text,
          :url => "https://weworkremotely.com#{attributes.css("a").attribute("href").value}"
        }
        @jobs << jobs
      end
      RemoteJobSearch::Category.new(@category_name, @jobs)
    end
  end
end
