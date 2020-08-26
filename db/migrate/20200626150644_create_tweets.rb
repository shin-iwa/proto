class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :title, null:false
      t.text :text, null:false
      t.string :image
      t.integer :user_id, null:false
      t.timestamps
    end
  end
end
