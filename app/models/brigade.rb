class Brigade < ActiveRecord::Base
  attr_accessible :count_of_workers, :country_id, :price, :title, :job_tokens, :job_ids
  belongs_to :country
  has_and_belongs_to_many :jobs
  validates :title, :price, :country_id, :count_of_workers, :job_ids, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :count_of_workers, numericality: {greater_than: 0}

  attr_reader :job_tokens

  def job_tokens=(tokens)
  	self.job_ids = Job.ids_from_tokens(tokens)
  end

  def job_list
  	jobs.map(&:name).join(", ")  	
  end

  def self.filtered_and_ordered_by_params(country_id, job_ids, order_string)
    jobs_string = job_ids.to_s.gsub("[", "(").gsub("]", ")") #set [..] to "(..)"

    #produce order query to database
    order_query = if order_string =~ /price DESC|price|count_of_workers DESC|count_of_workers/
      order_string   
    elsif job_ids.size > 1
      "COUNT(*) DESC, price"
    else
      "price"
    end

    #produce filter query to database
    if country_id == 0 && job_ids == []
      return order(order_query) 
    elsif job_ids == []
      return where(country_id: country_id).order(order_query)
    elsif country_id == 0
      return joins(:jobs).where("brigades_jobs.job_id IN #{jobs_string}").group("brigades.id").order(order_query)
    else
      return where(country_id: country_id).joins(:jobs).where("brigades_jobs.job_id IN #{jobs_string}").group("brigades.id").order(order_query)
    end
  end

end
