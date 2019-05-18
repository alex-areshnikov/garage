class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.string :number
      t.text :description
      t.belongs_to :person, foreign_key: true

      t.timestamps
    end
  end
end
