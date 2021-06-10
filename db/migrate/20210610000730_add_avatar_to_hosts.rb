class AddAvatarToHosts < ActiveRecord::Migration[5.2]
  def change
    add_column :hosts, :avatar, :string
  end
end
