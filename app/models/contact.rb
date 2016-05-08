class Contact < ActiveRecord::Base
	validates :name, :met, presence: true
	validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates_numericality_of :phone, :only_integer => true
end