class SurveysController < ApplicationController 

  def index
    @surveys = Surveys.all
    user = Users.find(cookies.signed[:user_id])
    if user == '1'
      @surveys = Surveys.all
    else
      @surveys = Surveys.find_all_by_owner(user)
    end
  end
  
  def edit
    @UserSurveys = Surveys.find_by_s_id(params[:id])
  end
  
  def update
    survey = Surveys.find(params[:surveys][:s_id])
    survey.update_attributes(:name => params[:surveys][:name])
      redirect_to :controller => "surveys", :action => "index"
  end
  
  def create
    name = params[:surveys][:name]
    conn = ActiveRecord::Base.connection
    sql = "insert into surveys (name,owner) " +
    "values ('" + name + "','" + cookies.signed[:user_id].to_s + "')"
    conn.insert(sql)
    redirect_to :controller => "surveys", :action => "index"
  end
  
  def view
    surveydata = params[:id].to_s
    survey = surveydata[2]
    questionname = Questions.find_by_s_id(params[:id])[:question]
    @green = Answers.count(:conditions => "questions.s_id =" + survey + "AND answer=false", 
      :joins => "LEFT JOIN questions on questions.q_id = answers.q_id")
    @red = Answers.count(:conditions => "questions.s_id =" + survey + "AND answer=true",
      :joins => "LEFT JOIN questions on questions.q_id = answers.q_id")
    @graph = Gchart.bar(:title => questionname,
           :data => [[@red], [@green]], 
           :bar_colors => 'FF0000,00FF00',
           :stacked => false, 
           :size => '400x200',
           :legend => ["True", "False"] )

    respond_to do |format|
      format.html
      #format.pdf do
       # render :pdf => "Survey_Results.pdf"
      #end
    end
  end
  
  
end
