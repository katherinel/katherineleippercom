class RemoveIsDefaultFromImages < ActiveRecord::Migration
  def self.up
  	remove_column :images, :is_default
	end

	def self.down
		add_column :images, :is_default, :boolean
	end
end
