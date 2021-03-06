class SoundsController < ApplicationController
  def index
    sounds = Sound.listing
    render json: SoundSerializer.new(sounds)
  end

  def create
    ApplicationRecord.transaction do
      file = Sound.create(data: { name: sound_params[:filename] })
      file.upload_file(sound_params)
    end

    head :created
  end

  def update
    sound = Sound.find(params[:id])
    sound.update(sound_params)

    head :no_content
  end

  def destroy
    sound = Sound.find(params[:id])
    sound.destroy

    head :no_content
  end

  private

  def sound_params
    params.require(:sound).permit!
  end
end
