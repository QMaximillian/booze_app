require 'set'

class Alcohol < ApplicationRecord
  has_many :user_alcohols
  has_many :users, through: :user_alcohols
  has_many :store_alcohols
  has_many :stores, through: :store_alcohols

  
  #validate for unique entries?

	def self.search(search)
	  Alcohol.all.select do |alcohol|
	  	alcohol.brand.downcase.include?(search.downcase) || alcohol.variety.downcase.include?(search.downcase) || alcohol.category.downcase.include?(search.downcase)
	  end
	end

	


end
