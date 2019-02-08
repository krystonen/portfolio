class CreateCatalogs < ActiveRecord::Migration[5.2]
  def change
    create_table :catalogs do |t|
      t.string :subtitle
      t.text :body
      t.text :main_image
      t.text :thumb_image

      t.timestamps
    end
  end
end
