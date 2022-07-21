class CartController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index

  end

  def update
    song = Song.find(params[:song_id])

    # song_id_str = song.id.to_s
    # session[:cart] ||= Hash.new(0)
    # session[:cart][song_id_str] ||= 0
    # quantity = session[:cart][song_id_str] += 1
    #Refactored to below:
    # session getting & setting still happening in controller
   #but any actions with the cart go to the poro

    cart.add_song(song.id)
    session[:cart] = cart.contents
    quantity = cart.count_of(song.id)

    flash[:notice] = "You now have #{pluralize(quantity, 'copy')} of #{song.title} in your cart."

    redirect_to songs_path
  end
end
