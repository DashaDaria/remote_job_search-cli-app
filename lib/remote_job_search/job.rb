class RemoteJobSearch::Job

  def self.this_week
    #return jobs by category for this week
    puts <<-DOC.gsub /^\s+/, ""
      1. Design
      2. Management
      3. Development
      4. Marketing
      5. Finance
    DOC
  end

end
