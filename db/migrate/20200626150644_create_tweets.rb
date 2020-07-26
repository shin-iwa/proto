class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :text, null:false
      t.text :image
      t.integer :user_id
      t.timestamps
    end
  end
end
