class CreateImagesTags < ActiveRecord::Migration[5.0]
  def change
    create_table :images_tags do |t|
      t.column :image_id, :integer
      t.column :tag_id, :integer

    end
  end
end
