class Question < ActiveRecord::Base
  attr_accessible :content, :survey_id, :choices_attributes
  belongs_to :survey
  has_many :choices
  accepts_nested_attributes_for :choices

  validates :content, presence: true

end
