require 'spec_helper'

describe "PostsFlows" do
  let!(:survey) { FactoryGirl.create(:survey) }
  5.times do
    let!(:question) { FactoryGirl.create(:question, survey: survey) }
    2.times do
      let!(:choice) { FactoryGirl.create(:choice, question: question) }
    end
  end

  subject { page }

  describe "the home page" do
    before { visit root_path }
    it { should have_content survey.title }
  end

  describe 'visiting survey#show' do
    before { visit survey_path(survey) }
    it { should have_content question.content }
  end

  describe 'taking a survey' do
    before do
     visit survey_path(survey)
     choose choice.content
     click_button 'Submit'
   end

   it { should have_url results_path(survey) }
  end
end
