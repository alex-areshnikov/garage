class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :name
      t.text :description
      t.references :owner, polymorphic: true
      t.string :file
      t.string :document_type
      t.string :certificate_number
      t.string :issued_by
      t.date :issued_date

      t.timestamps
    end
  end
end
