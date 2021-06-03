class AddPhotoToHosts < ActiveRecord::Migration[5.2]
  def change
    add_column :hosts, :photo, :string
    add_column :hosts, :first_name, :string
    add_column :hosts, :last_name, :string
    add_column :hosts, :address, :string
    add_column :hosts, :phone_number, :string
    add_column :hosts, :birth_date, :string
  end
end
