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



#   def self.homepage_scraper
#     homepage = Nokogiri::HTML(open("https://weworkremotely.com"))
#
#     scraped_jobs_array = []
#     homepage.css("article").each do |job_category|
#       job = {
#         # :category => job_category.css("h2 a").text,
#         :company => job_category.css("ul li a span.company").text,
#         :title => job_category.css("ul li a span.title").text,
#         :date => job_category.css("ul li a span.date").text,
#         :url => "https://weworkremotely.com#{job_category.css("li a").attribute("href").value}"
#       }
#       scraped_jobs_array << job
#
#       job_page = Nokogiri::HTML(open(job[:url]))
#         job[:details] = job_page.css("div.listing-container").text
#         job[:apply_link] = job_page.css("div.apply p a").attribute("href").value
#
#         scraped_jobs_array << job
#         binding.pry
#     end
#     scraped_jobs_array
end
