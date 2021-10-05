test = Messenger::User.find_or_initialize_by(email: 'test@test.com')
jack = Messenger::User.find_or_initialize_by(email: 'jack_london@mail.com')
marco = Messenger::User.find_or_initialize_by(email: 'marco_polo@mail.com')
katy = Messenger::User.find_or_initialize_by(email: 'katy_perry@mail.com')

test.password = '123456abc@' and test.save! unless test.persisted?
jack.password = '123456abc@' and jack.save! unless jack.persisted?
marco.password = '123456abc@' and marco.save! unless marco.persisted?
katy.password = '123456abc@' and katy.save! unless katy.persisted?

Messenger::User.where(id: [test, jack, marco, katy]).each do |user|
  chats = user.chats

  Messenger::User.where(id: [test, jack, marco, katy]).where.not(id: user).each do |u|
    next if chats.joins(:chat_members).where(chat_members: { id: u }).any?

    chat = Messenger::Chat.create!

    chat.chat_members.create!(user_id: user.id)
    chat.chat_members.create!(user_id: u.id)
  end
end

Messenger::User.create!(email: 'test1@test.com', password: '123456abc@') unless Messenger::User.exists? email: 'test1@test.com'
Messenger::User.create!(email: 'jack_london1@mail.com', password: '123456abc@') unless Messenger::User.exists? email: 'jack_london1@mail.com'
Messenger::User.create!(email: 'marco_polo1@mail.com', password: '123456abc@') unless Messenger::User.exists? email: 'marco_polo1@mail.com'
Messenger::User.create!(email: 'katy_perry1@mail.com', password: '123456abc@') unless Messenger::User.exists? email: 'katy_perry1@mail.com'
