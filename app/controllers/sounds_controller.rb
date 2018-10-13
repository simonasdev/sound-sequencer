class SoundsController < ApplicationController
  def index
    sounds = Sound.all
    render json: SoundSerializer.new(sounds)
  end

  def create
    Sound.upload_file(:params)
    render json: '{message: "Created! Thanks!"}'
  end

  def edit
    sound = Sound.find(params[:id])
    render json: SoundSerializer.new(sound)
  end

  def update
    sound = Sound.upload_file(params)
    # sound.update(params)  Not sure how do we update and what params we receive
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
