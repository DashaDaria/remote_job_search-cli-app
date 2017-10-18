class RemoteJobSearch::Scraper

  def self.job_scraper
    homepage = Nokogiri::HTML(open("https://weworkremotely.com"))
    homepage.css("article").collect do |job_category|
      job = {
        :category => job_category.css("h2 a").text,
        :status => job_category.css("ul li span.new").text,
        :company => job_category.css("ul li a span.company").text,
        :title => job_category.css("ul li a span.title").text,
        :date => job_category.css("ul li a span.date").text
        :url => "https://weworkremotely.com#{job_category.css("li a").attribute("href").value}"
      }

      job_page = Nokogiri::HTML(open(jobs[:url]))
      binding.pry
        job[:details] = jo_page.css("")
        job[:apply_link] =

        job
    end
  end
end
