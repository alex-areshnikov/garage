class CreateSitesPeopleJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :people_sites do |t|
      t.belongs_to :site, foreign_key: true
      t.belongs_to :person, foreign_key: true
      t.string :relationship
    end
  end
end
