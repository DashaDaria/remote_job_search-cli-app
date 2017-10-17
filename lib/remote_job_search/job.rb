class RemoteJobSearch::Job


  def self.category
    #return jobs by category
    puts <<-DOC.gsub /^\s+/, ""
      1. Design
      2. Management
      3. Development
      4. Marketing
      5. Finance
    DOC
    # job_1 = Job.new
    # job_2.name = "dddd"
    # job_2.price =
  end

end
