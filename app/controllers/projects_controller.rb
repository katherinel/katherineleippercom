class ProjectsController < ApplicationController
	http_basic_authenticate_with name: "admin", password: ENV["SITE_PASSWORD"], only: [:new, :edit, :destroy]

	def index
		@projects = Project.all
		@categories = Category.all
	end
	
	def show
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to :action => :index
		else
			redirect_to new_project_path
		end
	end

	def edit
		@project = Project.find(params[:id])
	end

	private

	def project_params
		params.require(:project).permit(:title, :short_description, :long_description, :begin_date, :end_date, :image_matching_color)
	end
end
