class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title, null:false
      t.text :body, null:false
      t.references :user, foreign_key: true, null: false
      t.references :tweet, foreign_key: true, null: false
      t.timestamps
    end
  end
end
