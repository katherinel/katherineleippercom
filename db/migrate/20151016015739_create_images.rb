class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.references :project
      t.integer :project_id
      t.string :url
      t.boolean :is_default

      t.timestamps null: false
    end
  end
end
