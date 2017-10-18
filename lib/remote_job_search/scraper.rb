class RemoteJobSearch::Scraper

  def self.job_scraper
    homepage = Nokogiri::HTML(open("https://weworkremotely.com"))
    homepage.css("section").collect do |job_category|
      job = {
        :category => job_category.css("h2 a").text,
        :status => job_category.css("ul li span.new").text,
        :company => job_category.css("ul li a span.company").text,
        :title => job_category.css("ul li a span.title").text,
        :date => job_category.css("ul li a span.date").text
        :url =>
      }

      job_page = Nokogiri::HTML(open(jobs[:url]))
        job[:details] =
        job[:apply_link] =

        job
    end
  end
end
