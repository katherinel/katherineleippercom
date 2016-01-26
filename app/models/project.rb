class Project < ActiveRecord::Base
	has_many :images, :dependent => :destroy
	has_and_belongs_to_many :categories
	accepts_nested_attributes_for :images, allow_destroy: true
	validates_presence_of :images
	validates_associated :images
	validates :title, :begin_date, :short_description, :long_description, :presence => true
	validates_format_of :image_matching_color, :with => /[A-Fa-f0-9]{6}|[A-Fa-f0-9]{3}/

	def begin_year
		if self.begin_date != nil
			self.begin_date.strftime('%Y')
		end
	end

	def end_year
		if self.end_date != nil
			self.end_date.strftime('%Y')
		end
	end

	def self.featured
		Project.order("end_date DESC").first(3) # fix this later
	end
end
