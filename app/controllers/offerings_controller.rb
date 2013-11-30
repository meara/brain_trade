class OfferingsController < ApplicationController

  def index
    @offerings = Offering.all
  end
end
