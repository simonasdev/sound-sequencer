class Sound < ApplicationRecord
  has_one_attached :file

  scope :listing, -> { order(id: :desc).preload(file_attachment: :blob) }

  def upload_file(params)
    decoded = Base64.decode64(params[:data].to_s.split(',').last)

    file.attach(
      **params.to_h.slice(:filename, :content_type).merge(
        io: DataStringIO.new(params[:filename], params[:content_type], decoded)
      ).symbolize_keys
    )
  end
end
