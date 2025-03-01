class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true, null: false
      t.string :title, null: false
      t.text :content
      t.references :category, foreign_key: true
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
