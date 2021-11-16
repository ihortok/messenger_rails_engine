class CreateChatsUsersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :messenger_chats, :messenger_users

    add_index :messenger_chats_users, :messenger_chat_id
    add_index :messenger_chats_users, :messenger_user_id
    add_index :messenger_chats_users, [:messenger_chat_id, :messenger_user_id], unique: true, name: 'index_chats_users_on_chat_id_and_user_id'
  end
end
