#CLI Controller - responsible for user interaction
class RemoteJobSearch::CLI

  def call
    welcome
    list_categories
    make_design_jobs
    menu
  end

    def welcome
      puts "Welcome to your next remote job opportunity!"
      puts "Enter a job category you'd like to see a list of jobs for:"
      puts ""
    end

    def list_categories
      category_names = RemoteJobSearch::Scraper.category_scraper
      @category_objects = []
      category_names.each do |category_name|
      new_object = RemoteJobSearch::Category.new(category_name)
      @category_objects << new_object
    end
      @category_objects.each.with_index(1) do |category, i|
        puts "#{i}. #{category.name}"
    end
  end

    def menu
      input = nil
      while input != "exit"
        puts ""
        puts "Type list to see the categories again or type exit."
        input = gets.strip.downcase

        if input.to_i > 0
          list_design_jobs

        elsif input == "list"
          list_categories
        elsif input == "exit"
          goodbye
          exit
        else
          puts "Not a valid entry, type list or exit "
        end
      end
    end

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

    def goodbye
      puts "Come back tomorrow for more jobs!"
    end
end
