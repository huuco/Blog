class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :picture
      t.integer :user_id
      t.integer :category_id
      t.integer :status , default: 0

      t.timestamps
    end
  end
end
