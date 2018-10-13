class SoundSerializer
  include FastJsonapi::ObjectSerializer
  include Rails.application.routes.url_helpers

  attributes :id, :data
  attribute :image_url

  def image_url
    url_for file
  end
end
