class ChangePhoneTypeOnContacts < ActiveRecord::Migration
  def change
  	change_column :contacts, :phone, :bigint
  end
end
