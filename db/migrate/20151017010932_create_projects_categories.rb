class CreateProjectsCategories < ActiveRecord::Migration
  def change
    create_table :projects_categories do |t|
      t.integer :project_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
