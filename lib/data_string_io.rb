class DataStringIO < StringIO
  attr_accessor :original_filename, :content_type

  def initialize filename, content_type, data
    super data

    self.original_filename = filename
    self.content_type = content_type
  end
end
