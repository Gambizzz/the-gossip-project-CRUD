class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.references :user, index: true
      t.references :gossip, index: true
      t.timestamps
    end
  end
end
