class ApplicationController < ActionController::API

  def ping
    render json: { pong: params.except(:controller, :action) }
  end

end
