class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.integer :following_user_id
      t.references :user, foreign_key:true, null:false
      t.timestamps
    end
  end
end
