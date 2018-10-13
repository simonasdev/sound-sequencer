class SoundsController < ApplicationController
  def index
    sounds = Sound.all
    render json: SoundSerializer.new(sounds)
  end

  def create
    file = Sound.create
    file.upload_file(sound_params)
    render json: '{message: "Created! Thanks!"}'
  end

  def update
    sound = sound.find(params[:id])
    sound.upload_file(sound_params)
    render json: '{message: "Created! Thanks!"}'
  end

  def destroy
    sound = Sound.find(params[:id])
    sound.destroy
    render json: '{message: "Deleted!"}'
  end

  private

  def sound_params
    params.require(:sound).permit!
  end
end
