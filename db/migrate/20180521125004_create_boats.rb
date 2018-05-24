class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.string :category
      t.boolean :availability, default: true
      t.integer :capacity
      t.string :city
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
