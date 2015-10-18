class Project < ActiveRecord::Base
	has_many :images
	validates_presence_of :images
	validates_associated :images
	validates :title, :begin_date, :short_description, :long_description, :presence => true
end
