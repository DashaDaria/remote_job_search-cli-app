class RemoteJobSearch::Scraper

  def self.category_scraper
    categories = Nokogiri::HTML(open("https://weworkremotely.com"))
    scraped_categories = []
      categories.css("h2 a").each do |job_category|
      category_name = job_category.text.strip.chomp(" Jobs")
      scraped_categories << category_name
    end
    scraped_categories.delete("")
    scraped_categories
  end

  def self.job_scraper

    # CATEGORY 1: DESIGN
    design_category = Nokogiri::HTML(open("https://weworkremotely.com"))
    scraped_design = []
    design_category.css("section.jobs#category-1").each do |design_job|
      design_job.css("ul li").each do |attributes|
        design_jobs = {
          :title => attributes.css("a span.title").text,
          :company => attributes.css("a span.company").text,
          :date => attributes.css("a span.date").text,
          :url => "https://weworkremotely.com#{attributes.css("a").attribute("href").value}"
        }
        scraped_design << design_jobs
      end
    end
    scraped_design
    binding.pry
end




# #ALL CATEGORIES
#   def self.categories_scraper
#     #Returns an array of all job categories as strings
#     homepage = Nokogiri::HTML(open("https://weworkremotely.com"))
#     scraped_categories = []
#     homepage.css("h2 a").each do |job_category|
#       category_name = job_category.text.strip.chomp(" Jobs")
#       scraped_categories << category_name
#     end
#     scraped_categories.delete("")
#     scraped_categories
#   end
#
#     def self.job_scraper


# #PROGRAMMING CATEGORY
#   def self.jobs_scraper_programming
#     #returns a collection of hashes with all job details information
#     #example of the return value:
#    #  {:title=>"Enjin Sr. Java SDK Developer",
#    #  :company=>"Enjin Pte Ltd",
#    #  :date=>"Oct 18",
#    #  :url=>"https://weworkremotely.com/jobs/5565-enjin-sr-java-sdk-developer"},
#    # {:title=>"Mobile Developer (Java and iOS)",
#    #  :company=>"codelathe",
#    #  :date=>"Oct 18",
#    #  :url=>"https://weworkremotely.com/jobs/5564-mobile-developer-java-and-ios"},
#     programming_homepage = Nokogiri::HTML(open("https://weworkremotely.com/categories/2-programming/jobs#intro"))
#     scraped_jobs = []
#
#       programming_homepage.css("li.feature").each do |job_outline|
#       job = {
#         :title => job_outline.css("a span.title").text,
#         :company => job_outline.css("a span.company").text,
#         :date => job_outline.css("a span.date").text,
#         :url => "https://weworkremotely.com#{job_outline.css("a").attribute("href").value}"
#         }
#       scraped_jobs << job
#       end
#       scraped_jobs
#    end
#
# #ADDITIONAL JOB DETAILS
#    def job_details_scraper(job_page_url)
#      scraped_jobs = self.jobs_scraper_programming
#      job_page = Nokogiri::HTML(open(job_page_url))
#           binding.pry
#    end
end
