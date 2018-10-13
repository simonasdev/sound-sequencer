class Sound < ApplicationRecord
  has_one_attached :file
  attr_accessor :data

  def upload_file params
    decoded = Base64.decode64(params[:data].to_s)

    file.attach(
      params.slice(:filename, :content_type).merge(
        io: DataStringIO.new(params[:filename], params[:content_type], decoded)
      )
    )
  end
end
