class Image < ActiveRecord::Base
	mount_uploader :image, ProjectImageUploader
	belongs_to :project
	after_save :save_versions

	def image_name
	  File.basename(image.path || image.filename) if image 
	end

	def save_versions # don't know why it's not doing this in the first place!
		self.image.recreate_versions!
	end

end
