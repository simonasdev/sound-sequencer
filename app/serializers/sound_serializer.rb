class SoundSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :data, :image_url
end
