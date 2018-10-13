class SoundSerializer
  include FastJsonapi::ObjectSerializer
  include Rails.application.routes.url_helpers

  attributes :id, :data

  attribute :image_url do
    url_for(file) if file
  end
end
