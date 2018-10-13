class SoundSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :data

  attribute :image_url do |object|
    Rails.application.routes.url_helpers.url_for(object.file) if object.file
  end
end
