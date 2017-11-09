class RemoteJobSearch::Category

  attr_accessor :category_name, :jobs

  @@all = []

  def initialize(category_name)
    @category_name = category_name
    @jobs = []
    @@all << self
  end

  def add_job(job)
    @jobs << job
  end


  def self.all
    @@all
  end

  def self.find(input)
    @@all[input.to_i-1]
  end

  def save
    if !@@all.include?(self)
      @@all << self
    end
  end
end
