class Image < ActiveRecord::Base
	mount_uploader :image, ProjectImageUploader
	belongs_to :project
	#validates :image, :presence => true

	def image_name
	  File.basename(image.path || image.filename) if image 
	end

end
