class SoundSerializer
  include FastJsonapi::ObjectSerializer
  include Rails.application.routes.url_helpers

  attributes :id, :data

  attribute :image_url do |object|
    url_for(object.file) if object.file
  end
end
