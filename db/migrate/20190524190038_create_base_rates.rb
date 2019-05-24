class CreateBaseRates < ActiveRecord::Migration[5.2]
  def change
    create_table :base_rates do |t|
      t.integer :year
      t.decimal :rate, precision: 4, scale: 2
    end
  end
end
