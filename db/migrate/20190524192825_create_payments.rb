class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :payment_type
      t.integer :units_paid
      t.decimal :value, precision: 4, scale: 2
      t.text :notes

      t.timestamps
    end
  end
end
