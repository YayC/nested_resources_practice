class Choice < ActiveRecord::Base
  attr_accessible :content, :num_respondents, :question_id
  validates :content, presence: true

  belongs_to :question
end
