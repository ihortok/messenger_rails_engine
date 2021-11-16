class CreateChatsUsersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :messenger_chats_users, id: false do |t|
      t.bigint :chat_id, null: false
      t.bigint :user_id, null: false
    end

    add_index :messenger_chats_users, [:chat_id, :user_id], unique: true
  end
end
