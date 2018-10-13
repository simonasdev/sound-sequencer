class SoundSerializer
  include FastJsonapi::ObjectSerializer

  attributes :data

  attribute :file_url do |object|
    Rails.application.routes.url_helpers.url_for(object.file.blob) if object.file.attached?
  end

  attribute :filename do |object|
    object.file.blob.filename if object.file.attached?
  end
end
