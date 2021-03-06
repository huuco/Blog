class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.boolean :enable
      t.integer :parent_id
      t.references :commentable, polymorphic: true

      t.timestamps
    end
  end
end
