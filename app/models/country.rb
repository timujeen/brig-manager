class Country < ActiveRecord::Base
  attr_accessible :title

  has_many :brigades
end
