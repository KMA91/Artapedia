class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :name
      t.string :description
      t.binary :data
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
