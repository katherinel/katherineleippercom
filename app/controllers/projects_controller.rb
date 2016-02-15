class ProjectsController < ApplicationController
	http_basic_authenticate_with name: "admin", password: ENV["SITE_PASSWORD"], only: [:new, :edit, :edit_projects, :destroy]

	def index
		if params[:category]
    	@projects = Project.joins(:categories).where(categories: {id: params[:category]}).uniq
  	else
			@projects = Project.all
		end
		@categories = Category.all
	end
	
	def show
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
		@project.images.build
		@uploader = Image.new.image
		@uploader.success_action_redirect = edit_projects_path
		@categories = Category.all
	end

	def create
		@project = Project.new(project_params)
		@uploader = Image.new.image
		@image = Image.new(key: params[:key])
		respond_to do |format|
			if @project.save
				format.html { redirect_to action: "index" }
			else
				flash[:error] = @project.errors.full_messages.to_sentence
				format.html { render action: "new" }
			end
		end
	end

	def edit
		@project = Project.find(params[:id])
		@categories = Category.all
	end

	def update
		@project = Project.find(params[:id])
		respond_to do |format|
			if @project.update_attributes(project_params)
				format.html { redirect_to action: "edit_projects" }
			else
				flash[:error] = @project.errors.full_messages.to_sentence
				format.html { render action: "edit" }
			end
		end
	end

	def edit_projects
		@projects = Project.all
	end

	def destroy
	  @project = Project.find(params[:id])
	  @project.destroy
	  redirect_to :action => 'edit_projects'
	end

	private

	def project_params
		params.require(:project).permit(:id, :title, :short_description, :long_description, :begin_date, :end_date, :image_matching_color, images_attributes: [:id, :image, :is_default, :_destroy], category_ids: [])
	end
end
