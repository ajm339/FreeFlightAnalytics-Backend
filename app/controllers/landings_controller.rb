class LandingsController < ApplicationController
  def index
  end

  def create
    begin
      puts '====================='
      GifWorker.perform_async(params[:framerate], params[:screenshotList])
    rescue
      puts 'fuckfuckfuckfuckfuckfuckfuckfuck'
    end
  end

end
