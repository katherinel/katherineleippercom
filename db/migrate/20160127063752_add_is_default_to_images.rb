class AddIsDefaultToImages < ActiveRecord::Migration
  def change
    add_column :images, :is_default, :boolean
    remove_column :projects, :default_image_id
  end
end
