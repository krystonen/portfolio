class AddPositionToCatalogs < ActiveRecord::Migration[5.2]
  def change
    add_column :catalogs, :position, :integer
  end
end
