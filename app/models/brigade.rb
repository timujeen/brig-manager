class Brigade < ActiveRecord::Base
  attr_accessible :count_of_workers, :country_id, :price, :title

  belongs_to :country
end
