require 'date'

class Project < ActiveRecord::Base
	has_many :images, :dependent => :destroy
	has_and_belongs_to_many :categories
	before_destroy { categories.clear }
	accepts_nested_attributes_for :images, allow_destroy: true
	validates_presence_of :images
	validates_associated :images
	validates :title, :begin_date, :short_description, :long_description, :presence => true
	validates_format_of :image_matching_color, :with => /[A-Fa-f0-9]{6}|[A-Fa-f0-9]{3}/
	validate :must_check_default_image
	validate :only_one_default_image
	validate :must_have_category

	def self.featured
		Project.order("end_date DESC").first(3) # fix this later
	end

	def must_check_default_image
		errors.add(:base, "You must select a default image") if self.images.all?{ |i| i.is_default.blank? }
	end

	def only_one_default_image
		errors.add(:base, "You can only have one default image") if self.images.where(is_default: true).length > 1
	end

	def must_have_category
		errors.add(:base, "You must select at least one category") if self.categories.blank?
	end

	def end_date
		self[:end_date] || Date.today
	end

	def years
		begin_year = self.begin_date.strftime('%Y')
		end_year = self.end_date.strftime('%Y')
		if begin_year == end_year
			[begin_year]
		else
			[begin_year, end_year]
		end
	end

	def default_image
		self.images.find_by(is_default: true)
	end

	def non_default_images
		self.images.where(is_default: nil)
	end
end
