class QuestionsController < ApplicationController
  def index
  end
  
  def create
    survey = params[:questions][:survey]
    question = params[:questions][:question]
    conn = ActiveRecord::Base.connection
    sql = "insert into questions (s_id,question) " +
    "values ('" + survey + "','" + question + "')"
    conn.insert(sql)
    redirect_to :controller => "surveys", :action => "index"
  end
  
  def chooseQuestion
  end



end
