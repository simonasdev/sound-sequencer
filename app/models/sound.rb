class Sound < ApplicationRecord
  has_one_attached :file

  scope :listing, -> { order(id: :desc).preload(file_attachment: :blob) }

  def upload_file params
    decoded = Base64.decode64(params[:data].to_s)
    Rails.logger.info params.slice(:filename, :content_type).merge(
        io: DataStringIO.new(params[:filename], params[:content_type], decoded)
      )
    file.attach(
      **params.symbolize_keys.slice(:filename, :content_type).merge(
        io: DataStringIO.new(params[:filename], params[:content_type], decoded)
      )
    )
  end
end
