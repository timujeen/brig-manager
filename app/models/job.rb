class Job < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :brigades

  scope :ordered_by_count_of_brigades, joins(:brigades).group("brigades_jobs.job_id").order("COUNT(*) DESC")

  def self.tokens(query)
  	jobs = where("name like ?", "%#{query}%")
  	if jobs.empty?
  		[{id: "<<<#{query}>>>", name: "New: \"#{query}\""}]
  	else
  		jobs
  	end  	
  end

  def self.ids_from_tokens(tokens)
  	tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1).id }
  	tokens.split(",")  	
  end
end
