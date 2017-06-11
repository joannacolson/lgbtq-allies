class CreateCategoriesResources < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_resources do |t|
      t.references :category, foreign_key: true
      t.references :resource, foreign_key: true

      t.timestamps
    end
  end
end
