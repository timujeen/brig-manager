class Brigade < ActiveRecord::Base
  attr_accessible :count_of_workers, :country_id, :price, :title, :job_tokens

  belongs_to :country
  has_and_belongs_to_many :jobs

  attr_reader :job_tokens

  def job_tokens=(tokens)
  	self.job_ids = Job.ids_from_tokens(tokens)
  end

  def job_list
  	jobs.map(&:name).join(", ")  	
  end
end
