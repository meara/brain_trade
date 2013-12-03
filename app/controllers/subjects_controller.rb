class SubjectsController < ApplicationController

  def show
    @subject = Subject.find_by_id(params[:id])
    @offerings = @subject.offerings
     if request.xhr?
        render :show, layout: false
     end 
  end

end
