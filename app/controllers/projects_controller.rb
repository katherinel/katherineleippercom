class ProjectsController < ApplicationController
	http_basic_authenticate_with name: "admin", password: ENV["SITE_PASSWORD"], only: [:new, :edit, :destroy]

	def index
		@projects = Project.all
		@categories = Category.all
	end
	
	def show
		@project = Project.find(params[:id])
	end

	def edit
	end
end
