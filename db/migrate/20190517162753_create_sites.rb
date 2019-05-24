class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :name
      t.decimal :area, precision: 5, scale: 1
      t.text :notes
      t.boolean :built
      t.boolean :registered
      t.boolean :basement
      t.integer :cars_count
      t.boolean :electricity
      t.string :electricity_counter_name
      t.date :electricity_counter_expiration_date
      t.boolean :rented

      t.timestamps
    end
  end
end
