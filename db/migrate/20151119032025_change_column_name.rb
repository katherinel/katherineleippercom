class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :images, :url, :image
  end
end
