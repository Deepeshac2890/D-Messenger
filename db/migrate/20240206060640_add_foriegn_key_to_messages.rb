class AddForiegnKeyToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :users, column: :from_user_id, primary_key: :id
  end
end
