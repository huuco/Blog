class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :star
      t.string :content

      t.timestamps
    end
  end
end
