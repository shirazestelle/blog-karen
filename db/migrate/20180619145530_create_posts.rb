class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :photo
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
