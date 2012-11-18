class AddAddressToPlaygrounds < ActiveRecord::Migration
  def change
    add_column :playgrounds, :address, :string
  end
end
