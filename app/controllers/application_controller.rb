class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  
  def index; end

  def asset_path
    render json: view_context.image_path(params[:filename])
  end
end
