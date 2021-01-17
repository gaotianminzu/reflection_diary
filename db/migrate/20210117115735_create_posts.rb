class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :fact, null: false
      t.text :notice, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
