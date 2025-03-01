class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.references :role, foreign_key: true

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
