class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.integer :price
      t.string :address
      t.string :city
      t.integer :rooms
      t.integer :beds

      t.timestamps
    end
  end
end
