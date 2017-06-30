class CreateUnlikes < ActiveRecord::Migration
  def change
    create_table :unlikes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :video, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
