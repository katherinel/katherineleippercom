class CreateJoinProjectsCategories < ActiveRecord::Migration
  def change
    create_table :join_projects_categories do |t|
      t.string :projects
      t.string :categories
    end
  end
end
