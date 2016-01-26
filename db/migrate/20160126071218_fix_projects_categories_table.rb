class FixProjectsCategoriesTable < ActiveRecord::Migration
  def change
  	drop_table :projects_categories

  	create_join_table :categories, :projects do |t|
      # t.index [:project_id, :category_id]
      # t.index [:category_id, :project_id]
    end
  end
end
