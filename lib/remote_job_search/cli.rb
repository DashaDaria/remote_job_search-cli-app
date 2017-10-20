#CLI Controller - responsible for user interaction
class RemoteJobSearch::CLI

  def call
    make_jobs
    # make_jobs
    # list_categories
    # menu
  end

    def make_jobs
      jobs_array = RemoteJobSearch::Scraper.job_attributes_array
      jobs = RemoteJobSearch::Job.create_from_scrape(jobs_array)
      binding.pry
    end
end


#   def call
#     welcome
#     list_categories
#     make_design_jobs
#     menu
#   end
#
#     def welcome
#       puts "Welcome to your next remote job opportunity!"
#       puts "Enter a job category you'd like to see a list of jobs for:"
#       puts ""
#     end
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
#     def menu
#       input = nil
#       while input != "exit"
#         puts ""
#         puts "Type list to see the categories again or type exit."
#         input = gets.strip.downcase
#
#               if input.to_i == 1
#               puts "Business/Exec & Management".colorize(:red)
#
#               elsif input.to_i == 2
#               puts  "Design".colorize(:red)
#
#               elsif input.to_i == 3
#                 puts "Marketing".colorize(:red)
#
#               elsif input.to_i == 4
#                 puts "Programming".colorize(:red)
#
#               elsif input.to_i == 5
#                 puts "DevOps & Sysadmin".colorize(:red)
#
#               elsif input.to_i == 6
#                 puts "All Other".colorize(:red)
#
#               elsif input.to_i == 7
#                 puts "Customer Support".colorize(:red)
#
#               elsif input.to_i == 8
#                 puts "Copywriting".colorize(:red)
#
#
#         elsif input == "list"
#           list_categories
#         elsif input == "exit"
#           goodbye
#           exit
#         else
#           puts "Not a valid entry, type list or exit "
#         end
#       end
#     end
#
#
#     def make_design_jobs
#       design_job_hash = RemoteJobSearch::Scraper.job_scraper
#       RemoteJobSearch::Job.create_from_scrape("Design", design_job_hash)
#     end
#
#     def list_design_jobs
#     # puts "DESIGN JOBS".colorize(:red)
#       RemoteJobSearch::Job.all.each.with_index(1) do |job, index|
#         puts "------------------------------------------------------------------------------------------------".colorize(:green)
#         puts "#{index}. #{job.title}"
#         puts "   #{job.company} // posted: #{job.date}"
#         puts "   More details:" + " #{job.url}".colorize(:blue)
#         puts "------------------------------------------------------------------------------------------------".colorize(:green)
#       end
#     end
#
#     def goodbye
#       puts "Come back tomorrow for more jobs!"
#     end
# end
