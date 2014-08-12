namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(first_name: "Example",
                 last_name: "User",
                 email: "example@user.org",
                 password: "password",
                 password_confirmation: "password",
                 admin: true,
                 age: 50,
                 sex: 'M',
                 height: 72,
                 goal: 'Admin',
                 job_type: 'Admin',
                 work_schedule: 'Admin',
                 current_weight: 200,
                 desired_weight: 180,
                 meals_per_day: 3,
                 snacks_per_day: 3,
                 body_fat_pct: 10,
                 plan_type: 'Admin')
    99.times do |n|
      first_name  = Faker::Name.first_name
      last_name   = Faker::Name.last_name
      email = "example-#{n+1}@user.org"
      password  = "password"
      sex = ['M','F','O']
      goal = ['Fat Loss','Maintenance','Muscle Gain','Tone']
      job_type = ['Full-Time Student',
                  'Full-Time Job - Desk Job',
                  'Full-Time Job - Moderate Activity (nursing, assembly line, etc.)',
                  'Full-Time Job - Heavy Activity (construction, factory, etc.)',
                  'Unemployed']
      work_schedule = ['Shift Work',
                       'Nine to Five',
                       'Part Time',
                       'Work from Home',
                       'Stay At Home Mom/Dad',
                       'Rotating (eg. 7 days on, 7 days off)']
      current_weight = rand(100)+100
      plan_type = ['6 Week','12 Week','24 Week','36 Week']
      User.create!(first_name: first_name,
                   last_name: last_name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   age: rand(80)+14,
                   sex: sex[rand(sex.length)],
                   height: rand(35)+48,
                   goal: goal[rand(goal.length)],
                   job_type: job_type[rand(job_type.length)],
                   work_schedule: work_schedule[rand(work_schedule.length)],
                   current_weight: current_weight,
                   desired_weight: current_weight-10,
                   meals_per_day: rand(5)+1,
                   snacks_per_day: rand(5)+1,
                   body_fat_pct: rand(25)+4,
                   plan_type: plan_type[rand(plan_type.length)])
    end
    user = User.first
    20.times do
      content = Faker::Lorem.paragraph(10)
      user.posts.create!(content: content, blog: true)
    end
  end
end