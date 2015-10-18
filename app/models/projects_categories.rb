class ProjectsCategories < ActiveRecord::Base
	validates :project_id, :category_id, :presence => true
end
