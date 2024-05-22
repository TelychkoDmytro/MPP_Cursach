class HomeController < ApplicationController
	def index
		@hobies = Hoby.all
	end
end
