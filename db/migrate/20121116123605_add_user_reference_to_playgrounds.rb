class AddUserReferenceToPlaygrounds < ActiveRecord::Migration
  def change
    change_table :playgrounds do |t|
      t.references :user
    end
  end
end
