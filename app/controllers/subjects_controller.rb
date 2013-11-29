class SubjectsController < ApplicationController

  def show
    @subject = Subject.find_by_id(params[:id])
    @offerings = @subject.offerings
  end

end
