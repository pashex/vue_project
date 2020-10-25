class StaffsController < ApplicationController
  layout 'staffs'

  def index; end

  def me
    if current_staff
      render json: current_staff
    else
      render json: { message: 'No user logged in' }
    end
  end
end
