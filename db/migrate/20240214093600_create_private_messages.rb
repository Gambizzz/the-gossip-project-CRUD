class CreatePrivateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :private_messages do |t|
      t.references :recipient, index: true
      t.references :sender, index: true
      t.text :content
      t.timestamps
    end
  end
end
