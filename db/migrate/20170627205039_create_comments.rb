class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.references :comment
      t.references :user
      t.timestamps null: false
    end
  end
end
