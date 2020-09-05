class HomeController < ApplicationController

	def index
		@tacos = Taco.all
	end
end
