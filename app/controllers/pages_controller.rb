#app/controllers/pages_controller.rb
class PagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def index
   if params[:order] == nil
    @surveys = Surveys.all
    respond_to do |format|
      format.html
      format.json { render :json => @surveys }
    end
    else
      @surveys = Surveys.all(:order => params[:order])
    end
  end
  def login
    username = params[:username]
    password = params[:passwd]
    conn = ActiveRecord::Base.connection
    user_id = conn.select_value("select get_id('" + username + "','" + password + "')").to_i
    if username == "guest" && password == "guest"
      cookies.signed[:user_id] = -1
    # redirect to guest page not implemented yet.
    end
    cookies.signed[:user_id] = user_id
    redirect_to :controller => "pages", :action => "loginstatus"
  end
  
  def logout
  end
  
  def loginstatus
    @id = cookies.signed[:user_id]
    render :xml => @id.to_s
  end
  
  def takesurvey
    conn = ActiveRecord::Base.connection
    code = params[:code]
    survey = conn.select_value("select get_survey('" + code + "')").to_i
    cookies.signed[:code] = code
    redirect_to :controller => "pages", :action => "surveystatus"
  end
  def surveystatus
    @survey = cookies.signed[:code]
    render :xml => @id.to_s
  end
end
