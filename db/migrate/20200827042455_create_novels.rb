class CreateNovels < ActiveRecord::Migration[6.0]
  def change
    create_table :novels do |t|
      t.string :title, null:false
      t.text :body, null:false
      t.references :user, foreign_key: true, null: false
      t.references :article, foreign_key: true, null: false
      t.timestamps
    end
  end
end
