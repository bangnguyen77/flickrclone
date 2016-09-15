class CreateTagsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :tags_users do |t|
      t.column :user_id, :integer
      t.column :tag_id, :integer

    end
  end
end
