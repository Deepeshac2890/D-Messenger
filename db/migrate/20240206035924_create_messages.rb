class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :message
      t.integer :from_user_id
      t.integer :to_user_id
      t.boolean :delivered
      t.timestamps
    end
  end
end
