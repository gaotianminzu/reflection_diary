class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :fact, null: false
      t.text :notice, null: false
      t.references :category, foreign_key: true 
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
