class SoundsController < ApplicationController
  def index
    sounds = Sound.all
    render json:
  end

  def create
    Sound.upload_file(:params)
  end

  def edit

  end

  private

  def sound_params
    params.require(:sound).permit!
  end
end
