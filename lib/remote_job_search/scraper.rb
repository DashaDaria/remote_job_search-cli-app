class RemoteJobSearch::Scraper


  def self.categories_scraper
    #Returns an array of all job categories as strings
    homepage = Nokogiri::HTML(open("https://weworkremotely.com"))
    scraped_categories = []
    homepage.css("h2 a").each do |job_category|
      category_name = job_category.text.strip
      scraped_categories << category_name
    end
    scraped_categories.delete("")
    scraped_categories
  end

def self.jobs_scraper_programming
  #returns a collection of hashes with all job details information
  programming_homepage = Nokogiri::HTML(open("https://weworkremotely.com/categories/2-programming/jobs#intro"))

  scraped_jobs = []
    programming_homepage.css("li.feature").each do |job_outline|

    job = {
      :title => job_outline.css("a span.title").text,
      :company => job_outline.css("a span.company").text,
      :date => job_outline.css("a span.date").text,
      :url => "https://weworkremotely.com#{job_outline.css("a").attribute("href").value}"
      }
    scraped_jobs << job
    end
    binding.pry
    scraped_jobs
 end
  #
  # def job_details_scraper
  #   programming_job_page = Nokogiri::HTML(open(job_info[:url]))
  #   job_info[:details] = programming_job_page.css("div.listing-container").text
  #   job_info[:apply_link] = programming_job_page.css("div.apply p a").attribute("href").value
  #
  #   binding.pry

#   end
# end

  # def self.homepage_scraper
  #   homepage = Nokogiri::HTML(open("https://weworkremotely.com"))
  #
  #   category_with_jobs = {}
  #   homepage.css("article").each do |job_category|
  #     title = job_category.css("h2 a").text
  #
  #     job = {
  #       # :category => job_category.css("h2 a").text,
  #       :company => job_category.css("ul li a span.company").text,
  #       :title => job_category.css("ul li a span.title").text,
  #       :date => job_category.css("ul li a span.date").text,
  #       :url => "https://weworkremotely.com#{job_category.css("li a").attribute("href").value}"
  #     }
  #     scraped_jobs_array << job
  #
  #     job_page = Nokogiri::HTML(open(job[:url]))
  #       job[:details] = job_page.css("div.listing-container").text
  #       job[:apply_link] = job_page.css("div.apply p a").attribute("href").value
  #
  #       scraped_jobs_array << job
  #       binding.pry
  #   end
  #   scraped_jobs_array
end
