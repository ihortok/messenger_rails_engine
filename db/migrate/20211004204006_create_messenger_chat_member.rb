class CreateMessengerChatMember < ActiveRecord::Migration[6.1]
  def change
    create_table :messenger_chat_members do |t|
      t.belongs_to :messenger_chat
      t.belongs_to :user

      t.timestamps
    end
  end
end
