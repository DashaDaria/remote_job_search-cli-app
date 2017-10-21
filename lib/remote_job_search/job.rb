class RemoteJobSearch::Job

  attr_accessor :title, :company, :date, :url, :category_name

  @@all = []

  def initialize(category_name, job_attributes)
    @category_name = category_name
    job_attributes.each do |job_key, job_value|
      self.send(("#{job_key}="), job_value)
    end
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    if !@@all.include?(self)
      @@all << self
    end
  end
end
