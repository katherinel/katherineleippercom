class Image < ActiveRecord::Base
	belongs_to :project
	validates_presence_of :project
	validates :url, :presence => true
end
