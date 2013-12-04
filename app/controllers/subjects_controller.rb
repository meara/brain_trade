class SubjectsController < ApplicationController

  skip_before_action :require_login
  skip_before_action :warn_not_logged_in

  def show
    @subject = Subject.find_by_id(params[:id])
    @offerings = @subject.offerings
     if request.xhr?
        render :show, layout: false
     end 
  end

end
