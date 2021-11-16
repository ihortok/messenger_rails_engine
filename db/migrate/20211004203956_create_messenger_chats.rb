class CreateMessengerChats < ActiveRecord::Migration[6.1]
  def change
    create_table :messenger_chats, &:timestamps
  end
end
