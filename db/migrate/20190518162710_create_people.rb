class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.belongs_to :site, foreign_key: true
      t.date :birthdate
      t.string :address
      t.string :passport_number
      t.string :passport_issued_by
      t.date :passport_issue_date

      t.timestamps
    end
  end
end
