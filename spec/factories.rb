require 'factory_girl_rails'
require 'faker'

FactoryGirl.define do
  sequence(:title) { |n| "Title #{n}" }
  sequence(:content) { |n| "This is Content #{n}" }

  factory :survey do
    title
  end

  factory :question do
    content
    survey
  end

  factory :choice do
    content
    question
  end
end
