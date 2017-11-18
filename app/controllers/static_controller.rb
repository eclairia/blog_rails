class StaticController < ApplicationController
	def index
		@page_title = "A propos du Figaro"
    	@meta_descr = "Apprenez-en plus sur nous!"
		render layout: "application"
	end
end
