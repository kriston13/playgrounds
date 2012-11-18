class AddPlaceToPgPicture < ActiveRecord::Migration
  def change
    change_table :pg_pictures do |t|
      t.string :place
    end
  end
end
