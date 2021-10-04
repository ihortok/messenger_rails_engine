class CreateMessengerChat < ActiveRecord::Migration[6.1]
  def change
    create_table :messenger_chats do |t|

      t.timestamps
    end
  end
end
