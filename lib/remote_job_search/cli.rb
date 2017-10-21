# CLI Controller - responsible for user interaction
class RemoteJobSearch::CLI

  def call
    welcome
    make_jobs
    list_categories
    menu
    goodbye
  end

  def welcome
    puts "Welcome to your next remote job opportunity!"
    puts "Enter a job category you'd like to see a list of jobs for:"
    puts ""
  end

  def make_jobs
    RemoteJobSearch::Scraper.job_scrape

  def list_categories
    RemoteJobSearch::Category.all.each.with_index(1) do |category, i|
      puts "#{i}. #{category.category_name}"
    end
  end

  def menu
    @input = nil
    while @input != "exit"
      puts ""
      puts "Type list to see the categories again or type exit."
      @input = gets.strip.downcase

      if @input.to_i.between?(1,8)
        list_jobs_from_category

      elsif @input == "list"
        list_categories

      elsif @input == "exit"
        goodbye
        exit

      else
        puts "Not a valid entry, type list or exit "
      end
    end
  end

  def list_jobs_from_category
    selected_category = RemoteJobSearch::Category.find(@input)
    puts ""
    puts "#{selected_category.category_name}".upcase.colorize(:red)
    selected_category.jobs.each.with_index(1) do |job, index|
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
end
