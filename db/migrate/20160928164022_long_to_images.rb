class LongToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :latitude, :float
    add_column :images, :longitude, :float
    add_column :images, :address, :string
  end
end
