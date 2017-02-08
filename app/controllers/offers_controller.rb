class OffersController < ApplicationController
  wrap_parameters format: [:json]

  def show
  end

  def create
    offer = OfferCreator.create()
    redirect_to(offer_path(offer))
  end

  def mentions
    offer = Offer.find(params[:id])
    render json: offer.reload.mentions.includes(:user).to_json(include: :user)
  end
end
