class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true, null: false
      t.references :country, foreign_key: true
      t.text :biography

      t.timestamps
    end
  end
end
