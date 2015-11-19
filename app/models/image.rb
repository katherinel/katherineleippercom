class Image < ActiveRecord::Base
	mount_uploader :image, ProjectImageUploader
	belongs_to :project
	#validates_presence_of :project
	validates :image, :presence => true
end
