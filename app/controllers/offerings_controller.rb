class OfferingsController < ApplicationController

  def index
    @offerings = Offering.all
  end

  def show
    @offering = Offering.find_by_id(params[:id])
  end

  def new
    @offering = Offering.new
    @category_names = []
    Category.all.each { |cat| @category_names << cat.name }
  end

  def create
    category = Category.find_by_name(params[:offering][:category])
    subject = category.subjects.find_by_name(params[:offering][:subject])
    if subject
      @offering = Offering.create(subject_id: subject.id,
                      teacher_id: current_user.id,
                      hangout: params[:offering][:hangout],
                      location: params[:offering][:location],
                      details: params[:offering][:details])
    else
      subject = category.subjects.create(name: params[:offering][:subject])
      @offering = Offering.create(subject_id: subject.id,
                      teacher_id: current_user.id,
                      hangout: params[:offering][:hangout],
                      location: params[:offering][:location],
                      details: params[:offering][:details])
    end
    
    if @offering
      redirect_to offering_path(@offering)
    else
      flash.now[:error] = 'Offering not created'
      render new_offering_path
    end
  end

  def edit
    @offering = Offering.find(params[:id])
    @category_names = []
    Category.all.each { |cat| @category_names << cat.name }
  end

  def update
    @offering = Offering.find(params[:id])
    category = Category.find_by_name(params[:offering][:category])
    subject = category.subjects.find_by_name(params[:offering][:subject])
    if subject
      updated = @offering.update(subject_id: subject.id,
                      hangout: params[:offering][:hangout],
                      location: params[:offering][:location],
                      details: params[:offering][:details])
    else
      subject = category.subjects.create(name: params[:offering][:subject])
      updated = @offering.update(subject_id: subject.id,
                      hangout: params[:offering][:hangout],
                      location: params[:offering][:location],
                      details: params[:offering][:details])
    end
    if updated
      flash[:success] = 'Offering Updated'
      redirect_to offering_path(@offering)
    else
      flash.now[:error] = 'Offering not Updated'
      render new_offering_path
    end
  end
end
