class RemoteJobSearch::Job
attr_accessor :category

  def self.category
    #return jobs by category
    # puts <<-DOC.gsub /^\s+/, ""
    #   1. Design
    #   2. Management
    #   3. Development
    #   4. Marketing
    #   5. Finance
    # DOC
    job_1 = self.new
    job_1.category = "Design"

    job_2 = self.new
    job_2.category = "Marketing"

    [job_1, job_2]
  end

end
