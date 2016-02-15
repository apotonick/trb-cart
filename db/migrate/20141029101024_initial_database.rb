class InitialDatabase < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text    :title
      t.text    :description
      t.float   :price
      t.integer :deleted

      t.timestamps
    end

    create_table :carts do |t|
      t.integer :user_id

      t.text :name
      t.text :description
      t.integer :count

      t.timestamps
    end

    create_table :users do |t|
      t.text :email
      t.text :password_encrypted

      t.timestamps
    end

    create_table :items do |t|
      t.integer :cart_id
      t.integer :product_id
      t.integer :qty
    end
  end
end
