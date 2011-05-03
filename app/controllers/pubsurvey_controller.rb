class PubsurveyController < ApplicationController
  def index
    id = params[:id]
    @surveys = Surveys.all
    @UserSurveys = Surveys.find_by_s_id(params[:id])
    @questions = Questions.find_by_s_id(id)
  end
  
  def take
  id = params[:id]
  @questions = Questions.find_by_s_id(id)[:question]
  @id = id
  end
  
  def go
  id = params[:questions][:id]
  answer = params[:questions][:ans]
  end
  

end
