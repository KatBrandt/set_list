class CartController < ApplicationController
  include ActionView::Helpers::TextHelper

  def update
    song = Song.find(params[:song_id])

    song_id_str = song.id.to_s
    session[:cart] ||= Hash.new(0)
    session[:cart][song_id_str] ||= 0
    quantity = session[:cart][song_id_str] += 1

    flash[:notice] = "You now have #{pluralize(quantity, 'copy')} of #{song.title} in your cart."
    redirect_to songs_path
  end
end