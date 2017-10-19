#CLI Controller - responsible for user interaction
class RemoteJobSearch::CLI

  def call
    # list_categories
    make_design_jobs
    list_design_jobs
    # goodbye
  end
  #
  #   def list_categories
  #     category_names = RemoteJobSearch::Scraper.category_scraper
  #     @category_objects = []
  #     category_names.each do |category_name|
  #     new_object = RemoteJobSearch::Category.new(category_name)
  #     @category_objects << new_object
  #   end
  #     puts "Enter a job category you'd like to see remote job opportunities for:"
  #     @category_objects.each.with_index(1) do |category, i|
  #       puts "#{i}. #{category.name}"
  #   end
  # end

    def make_design_jobs
      design_job_hash = RemoteJobSearch::Scraper.job_scraper
      RemoteJobSearch::Job.create_from_scrape("Design", design_job_hash)
    end

    def list_design_jobs
    puts "DESIGN JOBS".colorize(:red)
      RemoteJobSearch::Job.all.each.with_index(1) do |job, index|
        puts "------------------------------------------------------------------------------------------------".colorize(:green)
        puts "#{index}. #{job.title}"
        puts "   #{job.company} // posted: #{job.date}"
        puts "   More details:" + " #{job.url}".colorize(:blue)
        puts "------------------------------------------------------------------------------------------------".colorize(:green)
      end
    end


  # def menu
  #   input

  #
  # def menu
  #   input = nil
  #   while input != "exit"
  #     puts "Enter the number of the category you'd like to see jobs for or type list to see the categories again or type exit:"
  #     input = gets.strip.downcase
  #
  #     if input.to_i > 0
  #       job = @jobs[input.to_i-1]
  #       puts "#{job.category}"
  #     elsif input == "list"
  #       list_categories
  #     else
  #       puts "Not a valid entry, type list or exit "
  #     end
  #   end
  # end
  #
  # def goodbye
  #   puts "Come back for more jobs tomorrow"
  # end

end
