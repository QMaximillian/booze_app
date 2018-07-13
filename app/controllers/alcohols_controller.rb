class AlcoholsController < ApplicationController

	def new
		@alcohol = Alcohol.new
	end

	def create
		@alcohol = Alcohol.find_by(brand: alcohol_params[:brand], variety: alcohol_params[:variety])
		if @alcohol
		else
			@alcohol = Alcohol.new(alcohol_params)
		end

		if @alcohol.save
			UserAlcohol.create(alcohol_id: @alcohol.id, user_id: current_user.id)
			redirect_to user_path(current_user)
		else
			render :new
		end
	end


	def wines
		@wines = Alcohol.all.select do |alcohol|
			alcohol.category == "Wine"
		end

		@wine_var_arr = 
			@wines.map do |wine| 
				wine.variety 
			end.uniq	


	end

	def beers
		@beers = Alcohol.all.select do |alcohol|
			alcohol.category == "Beer"
		end

		@beer_var_arr = 
			@beers.map do |beer| 
				beer.variety 
			end.uniq
	end

	def liquors
		@liquors = Alcohol.all.select do |alcohol|
			alcohol.category == "Liquor"
		end

		@liquor_var_arr = 
			@liquors.map do |liquor| 
				liquor.variety 
			end.uniq	
		
	end

	def index
		@alcohols = Alcohol.all	

		@liquors = Alcohol.all.select do |alcohol|
			alcohol.category == "Liquor"
		end

		@liquor_var_arr = 
			@liquors.map do |liquor| 
				liquor.variety 
			end.uniq	

		@beers = Alcohol.all.select do |alcohol|
			alcohol.category == "Beer"
		end

		@beer_var_arr = 
			@beers.map do |beer| 
				beer.variety 
			end.uniq
			
		@wines = Alcohol.all.select do |alcohol|
			alcohol.category == "Wine"
		end

		@wine_var_arr = 
			@wines.map do |wine| 
				wine.variety 
			end.uniq	

		@stores = Store.all
		if params[:search]
			@alcohols = Alcohol.search(params[:search])
		end
	end


	def show
		@alcohol = Alcohol.find(params[:id])

	end

	private

	def alcohol_params
		params.require(:alcohol).permit(:brand, :category, :variety, :year, :notes)
	end
end
