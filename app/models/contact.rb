class Contact < ActiveRecord::Base
	validates :name, :met, presence: true
	validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, :allow_blank => true
	validates_numericality_of :phone, :only_integer => true, :allow_blank => true
	validates_length_of :phone, :minimum => 10, :maximum => 10, :message => 'must be ten digits', :allow_blank => true
end