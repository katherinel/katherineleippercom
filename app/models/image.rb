class Image < ActiveRecord::Base
	mount_uploader :image, ProjectImageUploader
	belongs_to :project
	validates :image, :presence => true
end
