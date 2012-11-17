class CreatePgPictures < ActiveRecord::Migration
  def change
    create_table :pg_pictures do |t|
      t.integer :playground_id
      t.string :image
      t.integer :user_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
