class SoundSerializer
  include FastJsonapi::ObjectSerializer
  attributes :data, :image_url
end
