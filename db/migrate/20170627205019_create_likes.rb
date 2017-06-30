class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :video
	  t.references :user
      t.timestamps null: false
    end
  end
end
