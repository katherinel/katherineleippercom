class AddDefaultImageToProjects < ActiveRecord::Migration
  def change
  	add_reference :projects, :default_image, references: :images
  end
end
