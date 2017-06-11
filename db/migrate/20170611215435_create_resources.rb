class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :name
      t.text :address
      t.text :website
      t.text :phone
      t.text :description
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
