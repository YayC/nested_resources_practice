class Survey < ActiveRecord::Base
  validates :title, presence: true
  attr_accessible :title, :questions_attributes

  has_many :questions
  accepts_nested_attributes_for :questions
  # magical setter: questions_attributes = { }
  # it will create questions object for you

  def results
    self.questions.map{ |q| q.choices.map {|c| c.num_respondents} }
  end

end
# { "survey"=>{"title"=>"", "questions_attributes"=>{
# "0"=>{"content"=>"", "_destroy"=>"0", "choices_attributes"=>{"0"=>{"content"=>"", "_destroy"=>"0"}, 
#                                                               "1"=>{"content"=>"", "_destroy"=>"0"},
#                                                               "2"=>{"content"=>"", "_destroy"=>"0"},
#                                                               "3"=>{"content"=>"", "_destroy"=>"0"}}
# },
# "1"=>{"content"=>"", "_destroy"=>"0", "choices_attributes"=>{"0"=>{"content"=>"", "_destroy"=>"0"}, "1"=>{"content"=>"", "_destroy"=>"0"}, "2"=>{"content"=>"", "_destroy"=>"0"}, "3"=>{"content"=>"", "_destroy"=>"0"}}}, 
# "2"=>{"content"=>"", "_destroy"=>"0", "choices_attributes"=>{"0"=>{"content"=>"", "_destroy"=>"0"}, "1"=>{"content"=>"", "_destroy"=>"0"}, "2"=>{"content"=>"", "_destroy"=>"0"}, "3"=>{"content"=>"", "_destroy"=>"0"}}}}}, "commit"=>"Create Survey"}
