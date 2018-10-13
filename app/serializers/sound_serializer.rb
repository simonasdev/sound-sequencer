class SoundSerializer
  include FastJsonapi::ObjectSerializer
  attributes :data, :image_url

  def image_url
    file.service_url
  end
end
