#CLI Controller - responsible for user interaction
class RemoteJobSearch::CLI

  def call
    welcome
    make_categories
    list_categories
    menu
    goodbye
  end

    def welcome
      puts "Welcome to your next remote job opportunity!"
      puts "Enter a job category you'd like to see a list of jobs for:"
      puts ""
    end

    def make_categories
      jobs_array = RemoteJobSearch::Scraper.job_attributes_array
      programming = RemoteJobSearch::Category.new("Programming", jobs_array)
      design = RemoteJobSearch::Category.new("Design", jobs_array)
      all_other = RemoteJobSearch::Category.new("All Other", jobs_array)
      customer_support = RemoteJobSearch::Category.new("Customer Support", jobs_array)
      business = RemoteJobSearch::Category.new("Business", jobs_array)
      devops = RemoteJobSearch::Category.new("DevOps", jobs_array)
      marketing = RemoteJobSearch::Category.new("Marketing", jobs_array)
      copywriting = RemoteJobSearch::Category.new("Copywriting", jobs_array)
    end

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
      # binding.pry
      puts "#{selected_category.category_name}".colorize(:red)
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
#
#     def list_categories
#       category_names = RemoteJobSearch::Scraper.category_scraper
#       @category_objects = []
#       category_names.each do |category_name|
#       new_object = RemoteJobSearch::Category.new(category_name)
#       @category_objects << new_object
#     end
#       @category_objects.each.with_index(1) do |category, i|
#         puts "#{i}. #{category.name}"
#     end
#     #Return value is an array of category objects -  #<RemoteJobSearch::Category:0x007faab51b0050 @jobs=[], @name="Design">
#   end
#
