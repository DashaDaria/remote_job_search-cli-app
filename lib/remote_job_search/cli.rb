#CLI Controller - responsible for user interaction
class RemoteJobSearch::CLI

  def call
    list_categories
    list_jobs
    menu
    goodbye
  end

  def list_categories
    puts "Enter a job category:"
    @jobs = RemoteJobSearch::Job.category
    @jobs.each.with_index(1) do |job, i|
      puts "#{i}. #{job.category}"
    end
  end

  def list_jobs
    puts "Choose job title for more information"
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the category you'd like to see jobs for or type list to see the categories again or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0
        job = @jobs[input.to_i-1]
        puts "#{job.category}"
      elsif input == "list"
        list_categories
      else
        puts "Not a valid entry, type list or exit "
      end
    end
  end

  def goodbye
    puts "Come back for more jobs tomorrow"
  end

end
