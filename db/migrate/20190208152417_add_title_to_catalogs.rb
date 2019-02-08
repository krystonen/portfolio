class AddTitleToCatalogs < ActiveRecord::Migration[5.2]
  def change
    add_column :catalogs, :title, :string
  end
end
