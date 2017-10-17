#CLI Controller - responsible for user interaction
class RemoteJobSearch::CLI

  def call
    puts "Enter a job category:"
    list_categories
  end

  def list_categories
    puts <<-DOC.gsub /^\s+/, ""
      1. Design
      2. Management
      3. Development
      4. Marketing
      5. Finance
    DOC
  end
end
