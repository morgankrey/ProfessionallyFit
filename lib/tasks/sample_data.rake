namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(first_name: "Example",
                 last_name: "User",
                 email: "example@user.org",
                 password: "password",
                 password_confirmation: "password",
                 admin: true)
    99.times do |n|
      first_name  = Faker::Name.first_name
      last_name   = Faker::Name.last_name
      email = "example-#{n+1}@user.org"
      password  = "password"
      User.create!(first_name: first_name,
                   last_name: last_name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    user = User.first
    20.times do
      content = Faker::Lorem.paragraph(10)
      user.posts.create!(content: content)
    end
  end
end