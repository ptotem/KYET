namespace :db do
  desc "Create dummy slides in the development database."

  task :populate => :environment do
    require 'ffaker'

    quiz = Quiz.create!(name: "Know your ET", is_survey: false, plus: 10, minus: 0)

    50.times do
      question = Question.create!(
          name: Faker::Lorem.sentence(1),
          answer: Faker::Lorem.sentence(1),
          insertion_date: (rand*30).ceil.days.ago,
          is_mcq: true
      )
      3.times do
        question.options.build(
            name: Faker::Lorem.words(4),
            is_correct: false
        )
      end
      question.options.build(
          name: Faker::Lorem.words(4),
          is_correct: true
      )

      quiz.questions<<question
    end

    Bonus.create!(name: "Double Trouble", multiplier: 1, plus:20, minus: 10, wagerable:true)
    Bonus.create!(name: "Weekly", multiplier: (rand*3).ceil, plus:0, minus: 0, wagerable:false)
    Bonus.create!(name: "Monthly", multiplier: (rand*5).ceil, plus:0, minus: 0, wagerable:false)
    Bonus.create!(name: "Early Bird", multiplier: 1, plus:20, minus: 0, wagerable:false, end_time:Time.now)

    bonus_questions=Question.all.sample(15)
    15.times do |i|
      bonus=Bonus.all.sample
      bonus.questions << bonus_questions[i]
    end

  end
end