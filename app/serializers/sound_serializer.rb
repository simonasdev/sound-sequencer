class SoundSerializer
  include FastJsonapi::ObjectSerializer

  attributes :data

  attribute :image_url do |object|
    Rails.application.routes.url_helpers.url_for(object.file) if object.file.attached?
  end

  attribute :filename do |object|
    object.file.name if object.file.attached?
  end
end
