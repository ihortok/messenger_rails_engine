class AddFirstNameAndLastNameAndNicknameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :messenger_users, :first_name, :string
    add_column :messenger_users, :last_name, :string
    add_column :messenger_users, :nickname, :string
  end
end
