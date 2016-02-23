class MoveDefaultImageToProjects < ActiveRecord::Migration
  def change
  	add_reference :projects, :default_image, references: :images
  	remove_column :images, :is_default
  end
end
