class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :content
      t.references :micropost, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
