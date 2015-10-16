class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.date :begin_date
      t.date :end_date
      t.string :short_description
      t.text :long_description
      t.integer :image_id
      t.string :image_matching_color

      t.timestamps null: false
    end
  end
end
