class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
      t.string :last_name
      t.string :first_name
      t.integer :phone_number
      t.date :dob
    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end
