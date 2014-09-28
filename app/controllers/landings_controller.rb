require 'base64'
require "RMagick"
include Magick

class LandingsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index
  end

  def make_gif
    image_list = Magick::ImageList.new
    image_list.delay = params[:delay]
    params[:screenshotList].each do |t|
      image = Magick::Image::from_blob(Base64.decode64(t.split(',')[1])).first
      image_list << image
    end

    image_list.write("public/animated.gif")
    render json: true
  end

end
