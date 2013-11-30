class OfferingsController < ApplicationController

  def index
    @offerings = Offering.all
  end

  def show
    @offering = Offering.find_by_id(params[:id])
  end

end
