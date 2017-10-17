#CLI Controller - responsible for user interaction
class RemoteJobSearch::CLI

  def call
    list_categories
    menu
    goodbye
  end

  def list_categories
    puts "Enter a job category:"
    puts <<-DOC.gsub /^\s+/, ""
      1. Design
      2. Management
      3. Development
      4. Marketing
      5. Finance
    DOC
    @job = RemoteJobSearch::Job.this_week 
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the category you'd like to see jobs for or type list to see the categories again or type exit:"
      input = gets.strip.downcase
      case input
        when "1"
          puts "list jobs for category 1..."
        when "2"
          puts "list jobs for category 2..."
        when "list"
          list_categories
        else
          puts "Not a valid entry, type list or exit"
      end
    end
  end

  def goodbye
    puts "Come back for more jobs tomorrow"
  end

end
