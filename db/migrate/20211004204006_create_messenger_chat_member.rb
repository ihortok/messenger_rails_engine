class CreateMessengerChatMember < ActiveRecord::Migration[6.1]
  def change
    create_table :messenger_chat_members do |t|
      t.integer :chat_id
      t.integer :user_id

      t.timestamps
    end
  end
end
