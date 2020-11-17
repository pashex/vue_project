class ClientsController < ApplicationController
  layout 'clients'

  before_action :check_staff, only: :create

  def index
    respond_to do |format|
      format.html
      format.json { render json: Client.all }
    end
  end

  def create
    client = Client.new(client_params)
    random_password = SecureRandom.hex(10)

    client.password = random_password
    client.password_confirmation = random_password

    if client.save
      render json: client
    else
      render json: { errors: client.errors.full_messages }, status: :bad_request
    end
  end

  private

  def client_params
    params.require(:client).permit(:fullname, :phone, :email)
  end

  def check_staff
    render json: { error: 'Not authorized' }, status: 401 unless current_staff
  end
end
