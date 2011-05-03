class TakesurveyController < ApplicationController
  def index
    name = params[:code]
    @questions = Questions.find_all_by_s_id(name)
  end

end
