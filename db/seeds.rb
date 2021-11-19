# frozen_string_literal: true

require 'faker'

test = Messenger::User.find_or_initialize_by(email: 'test@test.com')

unless test.persisted?
  test.password = '123456abc@'
  test.first_name = Faker::Name.first_name
  test.last_name = Faker::Name.last_name
  test.nickname = "#{Faker::Internet.username}-#{rand(9999)}"

  test.save!
end

100.times do
  loop do
    email = Faker::Internet.email

    next if Messenger::User.find_by(email: email)

    Messenger::User.create!(
      email: email,
      password: Faker::Internet.password,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      nickname: "#{Faker::Internet.username}-#{rand(9999)}"
    )

    break
  end
end

Messenger::User.all.each do |user|
  next if user == test

  next if test.chats.joins(:users).where(users: { id: user.id }).any?

  chat = Messenger::Chat.create!
  chat.users << test
  chat.users << user
end

chat = test.chats.sample

3000.times do
  chat.messages.create!(content: Faker::Lorem.paragraph, user: chat.users.sample)
end
