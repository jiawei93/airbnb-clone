class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.belongs_to :user, foreign_key: true
      t.text :description
      t.integer :max_guest
      t.integer :price

      t.timestamps
    end
  end
end
