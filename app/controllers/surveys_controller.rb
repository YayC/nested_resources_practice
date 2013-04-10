class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
    @survey = Survey.new
    3.times do
      question = @survey.questions.build
      2.times { question.choices.build }
    end

  end


  def create
    @survey = Survey.create(params[:survey])
    Rails.logger.info @survey.errors.full_messages.inspect
    redirect_to root_path
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def results
    @survey = Survey.find(params[:id])
    @questions = @survey.questions
    @results_array = @survey.results
  end

  def update
    # test in console using Survey.find(5 ).questions.map{ |q| q.choices.map {|c| c.num_respondents} }
    params[:questions].each_value do |choice_id|
      choice = Choice.find(choice_id)
      if choice.num_respondents
        choice.num_respondents += 1
      else
        choice.num_respondents = 1
      end
      choice.save
    end

    redirect_to results_path(params[:id])
  end
end
